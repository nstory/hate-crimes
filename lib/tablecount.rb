#!/usr/bin/env ruby
# Counts of Incidents and Offenses, modeled on the table of the same name in
# the EOPSS "Hate Crime in Massachusetts" report.
#
# For each year in YEARS, counts incidents (distinct incident_id) and offenses
# (rows) in input/ma-YYYY.csv, with the average across those years. Writes CSV
# to stdout.
#
#   ruby lib/tablecount.rb

require "csv"

YEARS = (2021..2025).to_a.freeze

counts = YEARS.map do |year|
  rows = CSV.read("input/ma-#{year}.csv", headers: true)
  [rows.map { |row| row["incident_id"] }.uniq.size, rows.size]
end

avg = ->(ns) { format("%.1f", ns.sum.to_f / ns.size) }

CSV($stdout) do |csv|
  csv << ["Crime Count", *YEARS, "Average"]
  [["Incidents", counts.map(&:first)], ["Offenses", counts.map(&:last)]].each do |label, ns|
    csv << [label, *ns, avg.(ns)]
  end
end
