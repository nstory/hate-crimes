"""incidents.py <agency>: list the CSV rows for an agency (matches agency name, case-insensitive)."""
import csv, sys, os
name = ' '.join(sys.argv[1:]).replace('-', ' ').replace('_', ' ').lower()
root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../..'))
seen = set()
for r in csv.DictReader(open(os.path.join(root, 'input/ma-2025.csv'), newline='')):
    agency = r['agency_pub_agency_name']
    if name not in agency.lower() and name not in r['agency_ucr_agency_name'].lower():
        continue
    key = r['month_ddocname']
    if key in seen:
        continue
    seen.add(key)
    print(' | '.join([agency, key, r['incident_date'], r['incident_offense_names'], r['incident_offense_biases']]))
if not seen:
    sys.exit(f'no rows match {name!r}')
