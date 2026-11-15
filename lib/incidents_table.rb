#!/usr/bin/env ruby
# Builds one row per incident from input/ma-2025.csv (which has one row per
# offense), joined with the reports and summaries:
#
#   request_status  Received (report PDF), Denied (withheld .txt), or blank
#   summary         the one-sentence summary for received reports, else blank
#
# Writes output/incidents.csv.

require "csv"
require "fileutils"

COLUMNS = %w[
  month_ddocname
  agency_pub_agency_name
  incident_date
  incident_offense_count
  incident_offense_names
  incident_offense_biases
  offender_count
  incident_exceptional_clearance
].freeze

OUT = "output/incidents.csv"

offenses = CSV.read("input/ma-2025.csv", headers: true)
incidents = offenses.group_by { |row| row["month_ddocname"] }

# month_ddocname => { "pdf" => path, "txt" => path }
reports = Hash.new { |h, k| h[k] = {} }
Dir["input/reports/*/*.{pdf,txt}"].each do |path|
  reports[File.basename(path, ".*")][File.extname(path).delete(".")] = path
end

(reports.keys - incidents.keys).sort.each do |name|
  warn "report file with no matching incident: #{reports[name].values.join(', ')}"
end

rows = incidents.map do |name, offense_rows|
  first = offense_rows.first
  files = reports.fetch(name, {})
  warn "both .pdf and .txt for #{name}" if files.size > 1

  status, summary =
    if (pdf = files["pdf"])
      summary_path = pdf.sub("input/reports/", "input/summaries/").sub(/\.pdf\z/, ".txt")
      if File.exist?(summary_path)
        ["Received", File.read(summary_path).strip]
      else
        warn "no summary yet for #{pdf}"
        ["Received", nil]
      end
    elsif files["txt"]
      ["Denied", nil]
    end

  COLUMNS.map { |col| first[col] } + [status, summary]
end

rows.sort_by! { |row| [row[COLUMNS.index("incident_date")].to_s, row[0]] }

FileUtils.mkdir_p(File.dirname(OUT))
CSV.open(OUT, "w") do |csv|
  csv << COLUMNS + %w[request_status summary]
  rows.each { |row| csv << row }
end

puts "wrote #{rows.size} incidents to #{OUT}"
