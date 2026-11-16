.PHONY: summarize-reports
summarize-reports:
	ruby lib/summarize_reports.rb

.PHONY: incidents-table
incidents-table:
	ruby lib/incidents_table.rb

tables/table%.csv: lib/table%.rb $(wildcard input/ma-*.csv)
	mkdir -p tables
	ruby $< > $@

TABLES = tables/table1.csv tables/table2.csv

.PHONY: readme
readme: $(TABLES)
	ruby lib/readme_tables.rb
