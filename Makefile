.PHONY: summarize-reports
summarize-reports:
	ruby lib/summarize_reports.rb

.PHONY: incidents-table
incidents-table:
	ruby lib/incidents_table.rb

tables/table1.csv: lib/table1.rb input/ma-2025.csv input/ma-2024.csv input/ma-2023.csv input/ma-2022.csv input/ma-2021.csv
	mkdir -p tables
	ruby lib/table1.rb > $@
