"""render.py <pdf> <outdir> [pages e.g. 1-3,5] [--password PW]: render pages to PNG (needs pymupdf)."""
import pymupdf as fitz, sys, os
args = sys.argv[1:]
pw = None
if '--password' in args:
    i = args.index('--password'); pw = args[i + 1]; del args[i:i + 2]
src, out = args[0], args[1]
os.makedirs(out, exist_ok=True)
doc = fitz.open(src)
if doc.needs_pass and not doc.authenticate(pw or ''):
    sys.exit('encrypted: pass --password')
def parse(spec, n):
    pages = []
    for part in spec.split(','):
        a, _, b = part.partition('-')
        pages += range(int(a), int(b or a) + 1)
    return pages
pages = parse(args[2], len(doc)) if len(args) > 2 else range(1, len(doc) + 1)
for n in pages:
    path = os.path.join(out, f'p{n:03d}.png')
    doc[n - 1].get_pixmap(dpi=110).save(path)
    print(path)
