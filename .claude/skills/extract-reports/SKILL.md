---
name: extract-reports
description: Split an agency's public records response (input/responses/<agency>) into one PDF per incident report in input/reports/<agency>/, named by month_ddocname from input/ma-2025.csv, plus a .txt for each report the agency said it withheld. Use when the user runs /extract-reports <agency> or asks to ingest/process an agency's response.
argument-hint: <agency dir name in input/responses>
---

# Extract incident reports from an agency's response

Argument: `$ARGUMENTS`, the name of a directory in `input/responses/` (e.g. `haverhill`).
All paths below are relative to the repo root.

- Source: `input/responses/<agency>/`, whatever the user downloaded. Emails (`.eml`), PDFs, portal printouts, zips, etc. **Never modify or delete anything in here.**
- Destination: `input/reports/<agency>/`
  - `<month_ddocname>.pdf` for each released report
  - `<month_ddocname>.txt` for each report the agency explicitly said it is withholding
- The existence of `input/reports/<agency>/` means the response has been ingested. There is no manifest.

If `$ARGUMENTS` is empty or `input/responses/$ARGUMENTS` doesn't exist, list the directories in `input/responses/` and say which ones have no `input/reports/` counterpart yet. Then stop.

## Helper scripts

They live in `.claude/skills/extract-reports/scripts/`. Run each with `uv run -q --with pypdf python -I <script> ...`, adding `--with cryptography` for encrypted PDFs and `--with pymupdf` for `render.py`. Always pass file paths as arguments. Never run Python from inside the responses directory.

| script | purpose |
|---|---|
| `incidents.py <agency>` | the agency's CSV rows: `month_ddocname`, date, offense, bias. Matches on agency name; pass a different spelling if no match. |
| `unpack_eml.py <file.eml> <outdir>` | prints headers and body text (HTML converted to text) and saves attachments into `outdir` |
| `pdftext.py [--full] <pdf>...` | page count plus the text of each page (first 800 chars unless `--full`). Flags encrypted PDFs and pages with no text layer. |
| `render.py <pdf> <outdir> [pages]` | renders pages to PNG so you can Read them as images (for scans or no-text pages). Needs `--with pymupdf`. |
| `assemble.py <out.pdf> <src.pdf>:<pages> [...]` | builds the output PDF from page ranges such as `1-3`, `5`, `1-2,4`. Accepts several sources, for when one incident's pages are spread across files. Use `--password PW` for encrypted sources. |

Work in a scratch directory (the session scratchpad if one is listed, otherwise `mktemp -d`), with one subfolder per source file.

## Procedure

1. **Look up the expected incidents.** Run `incidents.py`. It matches on substrings, so `salem` also returns Salem State University. Keep only the rows for the agency this directory belongs to; the ORI inside `month_ddocname` tells them apart. The incident number embedded in `month_ddocname` (e.g. `2025_07_MA0051100_25039688_INC` → `25039688`) is the agency's own case number, which is what's printed on the reports.

2. **Check for update mode.** If `input/reports/<agency>/` already exists, list what's there and note the modification times of both directories. The user has probably added new material. Process every source file, giving the files newer than the newest file in `reports/<agency>/` the most attention, and reconcile with what's already there:
   - An incident with no file yet: add it.
   - An incident with a `.txt`, now released: write the `.pdf` and delete the `.txt`. A pending → released response supersedes the earlier one.
   - An incident with a `.pdf`, and the new material has the same report again: leave it alone. Replace it only if the new version is clearly more complete (e.g. less redacted, or the full report where before there were only some pages), and say so.
   - Never delete a `.pdf` without asking the user.

3. **Unpack everything.** For each `.eml`, run `unpack_eml.py` and read the body. That is where the reasons for withholding usually are, along with passwords for protected PDFs and "click here to download" links. Unzip archives. Convert `.docx` or image files only if they contain reports, and tell the user if you can't handle a format. If an email only links to a download (or a portal) and has no attachments, tell the user they need to download it into `input/responses/<agency>/`. Don't fetch it yourself.

4. **Classify each document and find the report boundaries.** Run `pdftext.py`, and `render.py` plus Read for pages with no text. For each page, decide which incident it belongs to.
   - Reports usually start with a header page carrying the incident or case number. Continuation pages (narrative, signature or "Report Officers" pages, supplements) belong to the incident before them.
   - Supplemental reports, or several documents for one incident, go into one PDF, in their original order.
   - Cover letters, denial letters and portal status pages are correspondence, not reports. Use them only as a source of explanations.
   - Skip byte-identical duplicates (`shasum`).
   - Match the case numbers loosely: leading zeros, dashes and prefixes vary (Everett prints `950702`, the CSV has `0950702`; Greenfield prints `25GRF-890-OF` where the CSV has `25-890-OF`). If a report doesn't match any CSV row, don't guess. Report it to the user.

5. **Write the outputs.**
   - Reports: run `assemble.py input/reports/<agency>/<month_ddocname>.pdf <src>:<pages> ...`. A source that is already exactly one report can just be `cp`'d, unless it's encrypted, in which case run it through `assemble.py --password` so the output is unlocked.
   - Withheld reports: write `<month_ddocname>.txt` only when the agency **explicitly** says it is withholding or denying that report (exemption, referral to the DA or court, juvenile, domestic, etc.). "Pending review", "will follow" or silence are not withholdings, so don't write a file for those. Format:
     ```
     Withheld. <Agency/office, person and title if given>, <request no. if any>, <channel> dated <YYYY-MM-DD>:

     "<the agency's explanation, quoted verbatim>"

     Source: responses/<agency>/<file>[, p. N]
     ```
     If one statement covers several incidents without saying which reason goes with which, write it into each of their `.txt` files and add a line noting it is ambiguous.

6. **Verify.** For each output PDF, run `pdftext.py` and confirm that every incident number appearing in it is the one in its filename, and that no source pages belonging to a report were left out.

7. **Report back** with a table of every CSV incident for the agency:

   | month_ddocname | date | bias | result |
   |---|---|---|---|

   where the result is `pdf (N pages, from <source>)`, `withheld: <short reason>`, or `MISSING: not mentioned in response` / `pending per <source>`. Then list anything odd: unmatched reports, duplicates, ambiguous explanations, formats you couldn't read, and download links still to fetch. In update mode, say what changed.
