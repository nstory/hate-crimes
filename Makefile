.PHONY: summarize-reports
summarize-reports:
	ruby lib/summarize_reports.rb

.PHONY: incidents-table
incidents-table:
	ruby lib/incidents_table.rb
