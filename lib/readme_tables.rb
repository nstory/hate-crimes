#!/usr/bin/env ruby
# Renders each tables/tableN.csv as a Markdown table and writes it into
# README.md under the "### Table N:" heading, between marker comments:
#
#   <!-- tableN -->
#   ...generated table...
#   <!-- /tableN -->
#
# If the markers are missing they are added right after the heading. Anything
# outside the markers is left alone, so rerunning only refreshes the tables.
#
#   ruby lib/readme_tables.rb

require "csv"

README = "README.md"
NUMERIC = /\A(-?[\d,.]+%?|NA)\z/

def markdown_table(path)
  header, *rows = CSV.read(path)
  numeric = header.each_index.map { |i| rows.all? { |r| r[i].to_s.match?(NUMERIC) } }

  rows = rows.map do |row|
    row.first.match?(/\A(Grand Total|Total|Subtotal\b)/) ? row.map { |v| "**#{v}**" } : row
  end

  line = ->(cells) { "| #{cells.map { |c| c.to_s.gsub("|", "\\|") }.join(' | ')} |" }
  [
    line.(header),
    "|#{numeric.map { |n| n ? ' ---: ' : ' :--- ' }.join('|')}|",
    *rows.map(&line),
  ].join("\n")
end

readme = File.read(README)

Dir["tables/*.csv"].sort.each do |path|
  name = File.basename(path, ".csv") # e.g. "table1"
  open_tag = "<!-- #{name} -->"
  close_tag = "<!-- /#{name} -->"

  unless readme.include?(open_tag)
    # Only numbered tables get markers added automatically; other CSVs are
    # rendered only where markers have been placed by hand.
    next unless (num = name[/\Atable(\d+)\z/, 1])

    heading = readme[/^### Table #{num}:.*$/]
    unless heading
      warn "no '### Table #{num}:' heading in #{README}; skipping #{path}"
      next
    end
    readme.sub!(/^#{Regexp.escape(heading)}$/) { "#{heading}\n#{open_tag}\n#{close_tag}\n" }
  end

  body = "#{open_tag}\n\n#{markdown_table(path)}\n\n#{close_tag}"
  readme.sub!(/#{Regexp.escape(open_tag)}.*?#{Regexp.escape(close_tag)}/m) { body }
end

File.write(README, readme)
