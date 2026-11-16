#!/usr/bin/env ruby
# Table 1: Crimes Reported During Bias Incidents.
#
# Counts offenses in input/ma-YYYY.csv (one row per offense) by offense name
# for each year in YEARS, with each offense's share of that year's total and a
# Grand Total row. Rows are sorted by the most recent year's count descending.
# Writes CSV to stdout.
#
#   ruby lib/table1.rb

require "csv"

YEARS = [2025, 2024, 2023, 2022, 2021].freeze

counts = YEARS.to_h do |year|
  offenses = CSV.read("input/ma-#{year}.csv", headers: true)
  [year, offenses.map { |row| row["offense_name"] }.tally]
end
totals = counts.transform_values { |c| c.values.sum }

pct = ->(n, total) { format("%.1f%%", 100.0 * n / total) }
cells = ->(year, n) { [n, pct.(n, totals[year])] }

names = counts.values.flat_map(&:keys).uniq
latest = counts[YEARS.first]

CSV($stdout) do |csv|
  csv << ["Hate Crimes"] + YEARS.flat_map { |y| ["#{y} Total", "#{y} % of Total"] }
  names.sort_by { |name| [-latest.fetch(name, 0), name] }.each do |name|
    csv << [name] + YEARS.flat_map { |y| cells.(y, counts[y].fetch(name, 0)) }
  end
  csv << ["Grand Total"] + YEARS.flat_map { |y| cells.(y, totals[y]) }
end
