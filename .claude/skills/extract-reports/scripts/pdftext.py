"""pdftext.py [--full] [--password PW] <pdf>...: per-page text dump."""
import pypdf, sys
args = sys.argv[1:]
full = '--full' in args
args = [a for a in args if a != '--full']
pw = None
if '--password' in args:
    i = args.index('--password'); pw = args[i + 1]; del args[i:i + 2]
for f in args:
    r = pypdf.PdfReader(f)
    if r.is_encrypted:
        if pw is None or not r.decrypt(pw):
            print(f'== {f}: ENCRYPTED (pass --password)'); continue
    print(f'== {f}: {len(r.pages)} pages')
    for i, p in enumerate(r.pages):
        t = (p.extract_text() or '').strip()
        flag = '  [NO TEXT LAYER - render it]' if len(t) < 20 else ''
        print(f'--- p{i + 1} ({len(t)} chars){flag}')
        print(t if full else t[:800])
