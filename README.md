# Hate Crime Reports Project

## Table of Contents
- [Tables](#tables)
- [Incident Reports](#incident-reports)
- [Development Notes](#development-notes)

## Background
Each year, the [Massachusetts Hate Crimes Task Force](https://www.mass.gov/hate-crimes-task-force) puts out the Massachusetts Hate Crimes Report. The report provides tables aggregating hate crime incidents submitted by law enforcement agencies (LEA) and showing the delta from the previous year. We expect the report for calendar year 2025 will be released in December 2026.

## This Project
This project uses [FBI NIBRS data](https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/downloads) to [independently produce the tables](#tables) that will appear in the 2025 Hate Crimes Report. We are also [collecting incident reports](#incident-reports) directly from LEAs. Using these, we can provide a more in-depth view than the aggregate tables.

## Tables

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

### Table 3: Bias Type for Reported Offenses (2025) ([CSV](tables/table3.csv))
<!-- table3 -->

| Bias Type | Destruction/Damage/Vandalism of Property | Intimidation | Simple Assault | Aggravated Assault | All Other Larceny | Burglary/Breaking & Entering | Counterfeiting/Forgery | Extortion/Blackmail | False Pretenses/Swindle/Confidence Game | Kidnapping/Abduction | Motor Vehicle Theft | Pocket-picking | Rape | Stolen Property Offenses | Theft From Building | Weapon Law Violations | Grand Total |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Anti-Black or African American | 48 | 30 | 29 | 16 | 1 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 129 |
| Anti-Jewish | 88 | 12 | 2 | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 107 |
| Anti-Gay (Male) | 14 | 18 | 12 | 12 | 2 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 60 |
| Anti-Hispanic or Latino | 2 | 7 | 12 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 31 |
| Anti-Asian | 4 | 5 | 7 | 4 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 21 |
| Anti-Other Race/Ethnicity/Ancestry | 5 | 2 | 5 | 3 | 3 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 20 |
| Anti-Transgender | 5 | 7 | 5 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 18 |
| Anti-White | 1 | 3 | 5 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 17 |
| Anti-Lesbian, Gay, Bisexual, or Transgender (Mixed Group) | 7 | 1 | 2 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 14 |
| Anti-Islamic (Muslim) | 2 | 6 | 1 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 13 |
| Anti-Lesbian (Female) | 1 | 4 | 2 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 |
| Anti-Arab | 0 | 2 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 |
| Anti-Other Religion | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 |
| Anti-Gender Non-Conforming | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 4 |
| Anti-Mental Disability | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 |
| Anti-Physical Disability | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 |
| Anti-Bisexual | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 |
| Anti-Catholic | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 |
| Anti-Female | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| Anti-Hindu | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| Anti-Other Christian | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| Anti-Protestant | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| Anti-Sikh | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| **Grand Total** | **187** | **102** | **90** | **62** | **15** | **4** | **1** | **1** | **1** | **1** | **1** | **1** | **1** | **1** | **1** | **1** | **470** |

<!-- /table3 -->

### Table 18: Hate Crimes By Agency (Top 20) ([CSV](tables/table18.csv))
<!-- table18 -->

| Agency | 2025 Total | 2024 Total |
| :--- | ---: | ---: |
| Boston | 120 | 149 |
| Cambridge | 31 | 34 |
| Somerville | 20 | 8 |
| Springfield | 11 | 5 |
| Medford | 10 | 9 |
| Arlington | 9 | 6 |
| Medway | 8 | 0 |
| Belmont | 7 | 6 |
| Newton | 7 | 43 |
| Brandeis University | 6 | 9 |
| Brookline | 6 | 4 |
| Danvers | 6 | 10 |
| Lowell | 6 | 1 |
| Salem | 6 | 10 |
| Chelmsford | 5 | 2 |
| Framingham | 5 | 6 |
| Harvard University | 5 | 4 |
| Holyoke | 5 | 0 |
| Plymouth | 5 | 4 |
| Waltham | 5 | 4 |

<!-- /table18 -->


## Incident Reports

### Offense-level CSVs
These files contain offenses with a bias motivation reported in Massachusetts. They were created from the [FBI NIBRS data](https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/downloads). They contain one row per offense. A single incident report may have multiple offenses.

| File | Offenses | Unique Incidents |
| :--- | ---: | ---: |
| [ma-2021.csv](./input/ma-2021.csv) | 427 | 407 |
| [ma-2022.csv](./input/ma-2022.csv) | 452 | 433 |
| [ma-2023.csv](./input/ma-2023.csv) | 574 | 552 |
| [ma-2024.csv](./input/ma-2024.csv) | 481 | 467 |
| [ma-2025.csv](./input/ma-2025.csv) | 443 | 427 |

### 2025 Incidents with Summaries
We submitted public records requests to agencies across Massachusetts requesting the reports for the incidents in [ma-2025.csv](./input/ma-2025.csv).

For privacy reasons, we are not publishing the incident reports themselves. Instead, we've generated a one-sentence summary of each incident using [Claude Opus 5.5](https://platform.claude.com/docs/en/models/opus-5-5/overview).

[Download incidents.csv](./tables/incidents.csv) for all 2025 incidents with summaries.

Gathering the incident reports is a work in progress. This table tracks our progress:

<!-- progress -->

| Status | Incidents |
| :--- | ---: |
| Received | 55 |
| Denied | 17 |
| In Progress | 355 |
| **Total** | **427** |

<!-- /progress -->

# Development Notes

## AI Policy
Almost all of the code in this repo was written by [Claude Code](https://claude.com/product/claude-code). Two principles:
- AI is for writing code that's run by the computer
- AI is not for writing English that's read by humans

## Procedure
Download the response provided by the law enforcement agency (LEA) to input/responses/<lea name>/. Then run claude "/extract-reports <lea name>". It will create the corresponding input/reports/<lea name>/ directory with one file per incident report.

Run `make summarize-reports` to have claude make report summaries

## File Paths
```
input/responses/xxx # response from LEA xxx
input/reports/xxx/yyy.pdf # incident yyy from LEA xxx
input/reports/xxx/yyy.txt # reason incident yyy was withheld
input/summaries/xxx/yyy.txt # one sentence summary of yyy.pdf
```
