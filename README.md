# Hate Crime Reports Project

## PROCEDURE
Download the response provided by the law enforcement agency (LEA) to input/responses/<lea name>/. Then run claude "/extract-reports <lea name>". It will create the corresponding input/requests/<lea name>/ directory with one file per incident report.

## FILE PATHS
```
input/responses/xxx # response from LEA xxx
input/requests/xxx/yyy.pdf # incident yyy from LEA xxx
input/requests/xxx/yyy.txt # reason incident yyy was withheld
```
