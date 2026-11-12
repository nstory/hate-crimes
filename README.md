# Hate Crime Reports Project

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
