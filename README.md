# Hate Crime Reports Project

## BACKGROUND
Each year, the [Massachusetts Hate Crimes Task Force](https://www.mass.gov/hate-crimes-task-force) puts out the Massachusetts Hate Crimes Report. The report provides tables aggregating hate crime incidents submitted by law enforcement agencies (LEA) and showing the delta from the previous year. We expect the report for calendar year 2025 will be released in December 2026.

## THIS PROJECT
This project uses [FBI NIBRS data](https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/downloads) to independently produce the tables that will appear in the 2025 report. We are also collecting incident reports directly from LEAs. Using these, we can provide a more in-depth view than the aggregate tables.

## TABLES

### Table 1: Crimes Reported During Bias Incidents
### Table 2: Bias Types Reported to Police
### Table 3: Bias Type for Reported Offenses
### Table 18: Hate Crimes By Agency (Top 20)

# INTERNAL NOTES
The code in this project is all written by Claude. Don't edit it manually; ask Claude to do it.

## PROCEDURE
Download the response provided by the law enforcement agency (LEA) to input/responses/<lea name>/. Then run claude "/extract-reports <lea name>". It will create the corresponding input/reports/<lea name>/ directory with one file per incident report.

Run `make summarize-reports` to have claude make report summaries

## FILE PATHS
```
input/responses/xxx # response from LEA xxx
input/reports/xxx/yyy.pdf # incident yyy from LEA xxx
input/reports/xxx/yyy.txt # reason incident yyy was withheld
input/summaries/xxx/yyy.txt # one sentence summary of yyy.pdf
```
