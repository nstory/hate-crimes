.PHONY: summarize-reports
summarize-reports:
	ruby lib/summarize_reports.rb

.PHONY: incidents-table
incidents-table: tables/incidents.csv

tables/incidents.csv: lib/incidents_table.rb input/ma-2025.csv $(wildcard input/reports/*/*) $(wildcard input/summaries/*/*)
	ruby lib/incidents_table.rb

tables/progress.csv: lib/progress_table.rb tables/incidents.csv
	ruby $< > $@

tables/table%.csv: lib/table%.rb $(wildcard input/ma-*.csv)
	mkdir -p tables
	ruby $< > $@

TABLES = tables/tablecount.csv tables/table1.csv tables/table2.csv tables/table3.csv tables/table18.csv tables/progress.csv

.PHONY: readme
readme: $(TABLES)
	ruby lib/readme_tables.rb
