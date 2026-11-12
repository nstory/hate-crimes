"""assemble.py [--password PW] <out.pdf> <src.pdf>:<pages> [...]
pages: 1-indexed, e.g. 1-3 | 5 | 1-2,4 | all"""
import pypdf, sys
args = sys.argv[1:]
pw = None
if '--password' in args:
    i = args.index('--password'); pw = args[i + 1]; del args[i:i + 2]
out, specs = args[0], args[1:]
w = pypdf.PdfWriter()
total = 0
for spec in specs:
    src, _, rng = spec.rpartition(':')
    r = pypdf.PdfReader(src)
    if r.is_encrypted and not r.decrypt(pw or ''):
        sys.exit(f'{src}: encrypted, pass --password')
    n = len(r.pages)
    pages = []
    for part in (f'1-{n}' if rng == 'all' else rng).split(','):
        a, _, b = part.partition('-')
        pages += range(int(a), int(b or a) + 1)
    for p in pages:
        if not 1 <= p <= n:
            sys.exit(f'{src}: page {p} out of range (1-{n})')
        w.add_page(r.pages[p - 1]); total += 1
w.write(out)
print(f'{out}: {total} pages')
