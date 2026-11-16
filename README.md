# Hate Crime Reports Project

## BACKGROUND
Each year, the [Massachusetts Hate Crimes Task Force](https://www.mass.gov/hate-crimes-task-force) puts out the Massachusetts Hate Crimes Report. The report provides tables aggregating hate crime incidents submitted by law enforcement agencies (LEA) and showing the delta from the previous year. We expect the report for calendar year 2025 will be released in December 2026.

## THIS PROJECT
This project uses [FBI NIBRS data](https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/downloads) to independently produce the tables that will appear in the 2025 Hate Crimes Report. We are also collecting incident reports directly from LEAs. Using these, we can provide a more in-depth view than the aggregate tables.

## TABLES

### Table 1: Crimes Reported During Bias Incidents ([CSV](tables/table1.csv))
<!-- table1 -->

| Hate Crimes | 2025 Total | 2025 % of Total | 2024 Total | 2024 % of Total | 2023 Total | 2023 % of Total | 2022 Total | 2022 % of Total | 2021 Total | 2021 % of Total |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Destruction/Damage/Vandalism of Property | 174 | 39.3% | 183 | 38.0% | 202 | 35.2% | 139 | 30.8% | 140 | 32.8% |
| Intimidation | 98 | 22.1% | 100 | 20.8% | 171 | 29.8% | 134 | 29.6% | 145 | 34.0% |
| Simple Assault | 84 | 19.0% | 93 | 19.3% | 102 | 17.8% | 101 | 22.3% | 78 | 18.3% |
| Aggravated Assault | 60 | 13.5% | 62 | 12.9% | 58 | 10.1% | 54 | 11.9% | 43 | 10.1% |
| All Other Larceny | 14 | 3.2% | 26 | 5.4% | 17 | 3.0% | 6 | 1.3% | 6 | 1.4% |
| Burglary/Breaking & Entering | 3 | 0.7% | 3 | 0.6% | 3 | 0.5% | 1 | 0.2% | 1 | 0.2% |
| Counterfeiting/Forgery | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% |
| Extortion/Blackmail | 1 | 0.2% | 0 | 0.0% | 2 | 0.3% | 1 | 0.2% | 0 | 0.0% |
| False Pretenses/Swindle/Confidence Game | 1 | 0.2% | 2 | 0.4% | 1 | 0.2% | 1 | 0.2% | 1 | 0.2% |
| Kidnapping/Abduction | 1 | 0.2% | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% |
| Motor Vehicle Theft | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% |
| Pocket-picking | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% |
| Rape | 1 | 0.2% | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% |
| Stolen Property Offenses | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% |
| Theft From Building | 1 | 0.2% | 3 | 0.6% | 4 | 0.7% | 5 | 1.1% | 0 | 0.0% |
| Weapon Law Violations | 1 | 0.2% | 1 | 0.2% | 1 | 0.2% | 0 | 0.0% | 3 | 0.7% |
| Arson | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 1 | 0.2% | 0 | 0.0% |
| Credit Card/Automated Teller Machine Fraud | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% |
| Criminal Sexual Contact | 0 | 0.0% | 0 | 0.0% | 3 | 0.5% | 0 | 0.0% | 0 | 0.0% |
| Fondling | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% |
| Murder and Nonnegligent Manslaughter | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 2 | 0.5% |
| Pornography/Obscene Material | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% |
| Purse-snatching | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% | 1 | 0.2% |
| Robbery | 0 | 0.0% | 6 | 1.2% | 4 | 0.7% | 5 | 1.1% | 3 | 0.7% |
| Shoplifting | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 1 | 0.2% | 0 | 0.0% |
| Theft From Motor Vehicle | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 1 | 0.2% | 1 | 0.2% |
| Theft of Motor Vehicle Parts or Accessories | 0 | 0.0% | 0 | 0.0% | 1 | 0.2% | 0 | 0.0% | 0 | 0.0% |
| **Grand Total** | **443** | **100.0%** | **481** | **100.0%** | **574** | **100.0%** | **452** | **100.0%** | **427** | **100.0%** |

<!-- /table1 -->

### Table 2: Bias Types Reported to Police ([CSV](tables/table2.csv))
<!-- table2 -->

| Bias Types | 2024 Total | 2025 Total | % Change | % of 2025 Total |
| :--- | ---: | ---: | ---: | ---: |
| Anti-White | 11 | 17 | 54.5% | 3.6% |
| Anti-Black or African American | 128 | 129 | 0.8% | 27.4% |
| Anti-Asian | 23 | 21 | -8.7% | 4.5% |
| Anti-American Indian or Alaska Native | 0 | 0 | 0.0% | 0.0% |
| Anti-Native Hawaiian or Other Pacific Islander | 0 | 0 | 0.0% | 0.0% |
| Anti-Multiple Races, Group | 1 | 0 | -100.0% | 0.0% |
| Anti-Arab | 6 | 6 | 0.0% | 1.3% |
| Anti-Hispanic or Latino | 29 | 31 | 6.9% | 6.6% |
| Anti-Other Race / Ethnicity / Ancestry | 20 | 20 | 0.0% | 4.3% |
| **Subtotal Anti-Race / Ethnicity / Ancestry** | **218** | **224** | **2.8%** | **47.7%** |
| Anti-Jewish | 147 | 107 | -27.2% | 22.8% |
| Anti-Catholic | 3 | 2 | -33.3% | 0.4% |
| Anti-Islamic (Muslim) | 11 | 13 | 18.2% | 2.8% |
| Anti-Hindu | 0 | 1 | NA | 0.2% |
| Anti-Buddhist | 0 | 0 | 0.0% | 0.0% |
| Anti-Atheism/Agnosticism | 1 | 0 | -100.0% | 0.0% |
| Anti-Eastern Orthodox | 0 | 0 | 0.0% | 0.0% |
| Anti-Sikh | 3 | 1 | -66.7% | 0.2% |
| Anti-Other Religion | 10 | 7 | -30.0% | 1.5% |
| **Subtotal Anti-Religion** | **175** | **131** | **-25.1%** | **27.9%** |
| Anti-Gay | 53 | 60 | 13.2% | 12.8% |
| Anti-Lesbian | 12 | 9 | -25.0% | 1.9% |
| Anti-Lesbian, Gay, Bisexual, or Transgender (Mixed Group) | 18 | 14 | -22.2% | 3.0% |
| Anti-Bisexual | 0 | 2 | NA | 0.4% |
| **Subtotal Anti-Sexual Orientation** | **83** | **85** | **2.4%** | **18.1%** |
| Anti-Mental Handicap | 1 | 4 | 300.0% | 0.9% |
| Anti-Physical Handicap | 5 | 3 | -40.0% | 0.6% |
| **Subtotal Anti-Disability** | **6** | **7** | **16.7%** | **1.5%** |
| Anti-Female | 8 | 1 | -87.5% | 0.2% |
| Anti-Male | 1 | 0 | -100.0% | 0.0% |
| **Subtotal Anti-Gender** | **9** | **1** | **-88.9%** | **0.2%** |
| Anti-Transgender | 17 | 18 | 5.9% | 3.8% |
| Anti-Gender Non-Conforming | 2 | 4 | 100.0% | 0.9% |
| **Subtotal Anti-Gender Identity** | **19** | **22** | **15.8%** | **4.7%** |
| **Total** | **510** | **470** | **-7.8%** | **100.0%** |

<!-- /table2 -->

### Table 3: Bias Type for Reported Offenses ([CSV](tables/table3.csv))
### Table 18: Hate Crimes By Agency (Top 20) ([CSV](tables/table18.csv))

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
