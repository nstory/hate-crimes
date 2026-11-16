#!/usr/bin/env ruby
# Table 3: Bias Type for Reported Offenses.
#
# Cross-tabulates offense-bias pairs (an offense with two biases counts once
# for each, as in Table 2) in input/ma-YYYY.csv: one row per bias type, one
# column per offense type, with Grand Total row and column. Rows and columns
# are sorted by their totals, descending. Bias and offense names are NIBRS's.
# Writes CSV to stdout.
#
#   ruby lib/table3.rb [YEAR]    # default 2025

require "csv"

year = Integer(ARGV.fetch(0, 2025))

pairs = CSV.read("input/ma-#{year}.csv", headers: true).flat_map do |row|
  row["bias"].split("; ").map { |bias| [bias, row["offense_name"]] }
end
counts = pairs.tally

by_total = ->(tally) { tally.sort_by { |name, n| [-n, name] }.map(&:first) }
biases = by_total.(pairs.map(&:first).tally)
offenses = by_total.(pairs.map(&:last).tally)

CSV($stdout) do |csv|
  csv << ["Bias Type", *offenses, "Grand Total"]
  biases.each do |bias|
    cells = offenses.map { |o| counts.fetch([bias, o], 0) }
    csv << [bias, *cells, cells.sum]
  end
  totals = offenses.map { |o| biases.sum { |b| counts.fetch([b, o], 0) } }
  csv << ["Grand Total", *totals, totals.sum]
end
