#!/usr/bin/env ruby
# Progress on gathering incident reports: how many of the incidents in
# tables/incidents.csv we've received a report for, been denied, or are still
# waiting on (anything neither received nor denied). Writes CSV to stdout.
#
#   ruby lib/progress_table.rb

require "csv"

statuses = CSV.read("tables/incidents.csv", headers: true)
              .map { |row| row["request_status"] || "In Progress" }
              .tally

CSV($stdout) do |csv|
  csv << ["Status", "Incidents"]
  ["Received", "Denied", "In Progress"].each { |s| csv << [s, statuses.fetch(s, 0)] }
  csv << ["Total", statuses.values.sum]
end
