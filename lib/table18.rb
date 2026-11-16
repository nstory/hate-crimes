#!/usr/bin/env ruby
# Table 18: Hate Crimes By Agency (Top 20).
#
# Counts incidents (not offenses) per reporting agency in input/ma-YYYY.csv and
# lists the top 20, plus any agencies tied with 20th place, with the previous
# year's count alongside (0 if the agency reported no incidents that year).
# Sorted by the current year's count descending, then name. Writes CSV to
# stdout.
#
#   ruby lib/table18.rb [YEAR]    # default 2025

require "csv"

TOP = 20

year = Integer(ARGV.fetch(0, 2025))
prev = year - 1

# e.g. "Boston", or "State Police: Suffolk County" for agencies with a unit.
name = ->(row) { [row["agency_pub_agency_name"], row["agency_pub_agency_unit"]].compact.join(" ") }

# agency ORI => [name, incident count]
def agency_counts(year, name)
  CSV.read("input/ma-#{year}.csv", headers: true)
     .uniq { |row| row["incident_id"] }
     .group_by { |row| row["agency_ori"] }
     .transform_values { |rows| [name.(rows.first), rows.size] }
end

current = agency_counts(year, name)
previous = agency_counts(prev, name)

ranked = current.sort_by { |_, (agency, n)| [-n, agency] }
cutoff = ranked.fetch(TOP - 1, ranked.last)&.last&.last || 0

CSV($stdout) do |csv|
  csv << ["Agency", "#{year} Total", "#{prev} Total"]
  ranked.take_while { |_, (_, n)| n >= cutoff }.each do |ori, (agency, n)|
    csv << [agency, n, previous.fetch(ori, [nil, 0]).last]
  end
end
