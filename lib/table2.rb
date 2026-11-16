#!/usr/bin/env ruby
# Table 2: Bias Types Reported to Police.
#
# Counts offense-bias pairs (an offense with two biases counts once for each)
# in input/ma-YYYY.csv for the previous and current year, grouped into the bias
# categories used by the annual Massachusetts Hate Crimes Report, with
# subtotals, % change, and each row's share of the current year's total.
# Writes CSV to stdout.
#
#   ruby lib/table2.rb
#
# Differences from the report's layout, because NIBRS doesn't record the
# report's finer categories:
#   - Race and Ethnicity are a single group: NIBRS has one "Anti-Other
#     Race/Ethnicity/Ancestry" bias, which the report splits between them.
#   - No "Anti-Other Sexual Orientation" or "Anti-Other Handicap" rows; NIBRS
#     has no such biases.
#   - Christian denominations the report doesn't list (Other Christian,
#     Protestant) and Multiple Religions are counted as "Anti-Other Religion".
#   - Anti-Native Hawaiian or Other Pacific Islander gets its own row.

require "csv"

PREV, CUR = 2024, 2025

# [subtotal label, [[row label, [NIBRS bias names]], ...]]
GROUPS = [
  ["Subtotal Anti-Race / Ethnicity / Ancestry", [
    ["Anti-White", ["Anti-White"]],
    ["Anti-Black or African American", ["Anti-Black or African American"]],
    ["Anti-Asian", ["Anti-Asian"]],
    ["Anti-American Indian or Alaska Native", ["Anti-American Indian or Alaska Native"]],
    ["Anti-Native Hawaiian or Other Pacific Islander", ["Anti-Native Hawaiian or Other Pacific Islander"]],
    ["Anti-Multiple Races, Group", ["Anti-Multiple Races, Group"]],
    ["Anti-Arab", ["Anti-Arab"]],
    ["Anti-Hispanic or Latino", ["Anti-Hispanic or Latino"]],
    ["Anti-Other Race / Ethnicity / Ancestry", ["Anti-Other Race/Ethnicity/Ancestry"]],
  ]],
  ["Subtotal Anti-Religion", [
    ["Anti-Jewish", ["Anti-Jewish"]],
    ["Anti-Catholic", ["Anti-Catholic"]],
    ["Anti-Islamic (Muslim)", ["Anti-Islamic (Muslim)"]],
    ["Anti-Hindu", ["Anti-Hindu"]],
    ["Anti-Buddhist", ["Anti-Buddhist"]],
    ["Anti-Atheism/Agnosticism", ["Anti-Atheism/Agnosticism"]],
    ["Anti-Eastern Orthodox", ["Anti-Eastern Orthodox (Russian, Greek, Other)"]],
    ["Anti-Sikh", ["Anti-Sikh"]],
    ["Anti-Other Religion", ["Anti-Other Religion", "Anti-Other Christian", "Anti-Protestant",
                             "Anti-Multiple Religions, Group"]],
  ]],
  ["Subtotal Anti-Sexual Orientation", [
    ["Anti-Gay", ["Anti-Gay (Male)"]],
    ["Anti-Lesbian", ["Anti-Lesbian (Female)"]],
    ["Anti-Lesbian, Gay, Bisexual, or Transgender (Mixed Group)",
     ["Anti-Lesbian, Gay, Bisexual, or Transgender (Mixed Group)"]],
    ["Anti-Bisexual", ["Anti-Bisexual"]],
  ]],
  ["Subtotal Anti-Disability", [
    ["Anti-Mental Handicap", ["Anti-Mental Disability"]],
    ["Anti-Physical Handicap", ["Anti-Physical Disability"]],
  ]],
  ["Subtotal Anti-Gender", [
    ["Anti-Female", ["Anti-Female"]],
    ["Anti-Male", ["Anti-Male"]],
  ]],
  ["Subtotal Anti-Gender Identity", [
    ["Anti-Transgender", ["Anti-Transgender"]],
    ["Anti-Gender Non-Conforming", ["Anti-Gender Non-Conforming"]],
  ]],
].freeze

def bias_counts(year)
  CSV.read("input/ma-#{year}.csv", headers: true)
     .flat_map { |row| row["bias"].split("; ") }
     .tally
end

counts = { PREV => bias_counts(PREV), CUR => bias_counts(CUR) }

mapped = GROUPS.flat_map { |_, rows| rows.flat_map(&:last) }
unmapped = counts.values.flat_map(&:keys).uniq - mapped
abort "unmapped bias types: #{unmapped.join(', ')}" if unmapped.any?

totals = counts.transform_values { |c| c.values.sum }

change = lambda do |prev, cur|
  if prev.zero?
    cur.zero? ? "0.0%" : "NA"
  else
    format("%.1f%%", 100.0 * (cur - prev) / prev)
  end
end
line = lambda do |label, prev, cur|
  [label, prev, cur, change.(prev, cur), format("%.1f%%", 100.0 * cur / totals[CUR])]
end

CSV($stdout) do |csv|
  csv << ["Bias Types", "#{PREV} Total", "#{CUR} Total", "% Change", "% of #{CUR} Total"]
  GROUPS.each do |subtotal, rows|
    sums = rows.map do |label, names|
      prev, cur = [PREV, CUR].map { |y| names.sum { |n| counts[y].fetch(n, 0) } }
      csv << line.(label, prev, cur)
      [prev, cur]
    end
    csv << line.(subtotal, *sums.transpose.map(&:sum))
  end
  csv << line.("Total", totals[PREV], totals[CUR])
end
