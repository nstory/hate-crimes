---
name: summarize-report
description: Write a one-sentence summary of each incident report PDF in input/reports/<agency>/ to input/summaries/<agency>/<name>.txt. Use when the user runs /summarize-report <pdf>... or asks to summarize incident reports.
argument-hint: <report pdf> [<report pdf>...]
---

# Summarize incident reports

Arguments: `$ARGUMENTS`, one or more paths to report PDFs, such as `input/reports/salem/2025_08_MA0052800_2500026863_INC.pdf`. All paths are relative to the repo root. If no arguments are given, ask which reports to summarize and stop.

For each PDF, `input/reports/<agency>/<name>.pdf`, write the summary to `input/summaries/<agency>/<name>.txt`, creating the directory if needed. Overwrite any existing summary.

## Reading the report

Read the whole PDF with the Read tool. Reports are often scanned, sideways or partly redacted, so read the page images and don't rely only on a text layer. If a report has many pages, read it in chunks so nothing is missed.

## Writing the summary

One short sentence, plain text, ending with a newline. Say what the crime was, including the facts that make it a hate crime, such as the symbol, the words written or spoken, the sign's message, or how the victim was targeted.

- Leave out dates. Metadata already supplies them.
- Leave out the bias category, such as "anti-Jewish" or "anti-Palestinian". Metadata shows it next to the summary. Give the facts that show the bias instead.
- Don't explain well-known symbols. Write "a swastika", not "a swastika, an antisemitic symbol".
- Leave out the investigation and its follow-up: suspects, cleanup, notifications, internal reviews, the officer's actions.
- Leave out names of people. Name places, such as a school, store or cemetery, when that helps describe the incident.
- If the report gives only one party's account, attribute it, as in "reported that". Don't present disputed allegations as fact.
- Context that shows targeting is allowed, such as the same sign having been stolen before.

### Examples

- A swastika was drawn on a wall in the 7th-grade boys' bathroom at Ottoson Middle School.
- Someone wrote "Murder all Jews" between two swastikas in black marker on a "No Fishing" sign at Greenlawn Cemetery.
- A Whole Foods employee reported that her supervisor grabbed her wrist and has repeatedly mocked her disability.
- A resident's "I Support Palestinian Human Rights" lawn sign was stolen, the second time that sign had been taken.

## Finishing

When you're done, list each summary file you wrote along with its sentence. Point out any report that was unreadable, didn't appear to describe a hate crime, or needed a judgment call.
