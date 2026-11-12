#!/usr/bin/env ruby
# Runs /summarize-report on every report PDF that doesn't have a summary yet,
# BATCH_SIZE reports per Claude session.

batch_size = Integer(ENV.fetch("BATCH_SIZE", 10))

todo = Dir["input/reports/*/*.pdf"].sort.reject do |pdf|
  File.exist?(pdf.sub("input/reports/", "input/summaries/").sub(/\.pdf\z/, ".txt"))
end

todo.each_slice(batch_size) do |batch|
  system("claude", "-p", "--dangerously-skip-permissions", "/summarize-report #{batch.join(' ')}", exception: true)
end
