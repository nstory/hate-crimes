"""unpack_eml.py <file.eml> <outdir>: print headers + body text, save attachments to outdir."""
import email, sys, os, re, html
from email import policy
src, out = sys.argv[1], sys.argv[2]
os.makedirs(out, exist_ok=True)
m = email.message_from_binary_file(open(src, 'rb'), policy=policy.default)
for h in ('From', 'To', 'Date', 'Subject'):
    print(f'{h}: {m[h]}')
body = m.get_body(preferencelist=('plain', 'html'))
if body is not None:
    text = body.get_content()
    if body.get_content_type() == 'text/html':
        text = re.sub(r'(?is)<a [^>]*href=[\'"]([^\'"]+)[\'"][^>]*>(.*?)</a>', r'\2 [\1]', text)
        text = re.sub(r'(?i)<br\s*/?>|</p>|</div>', '\n', text)
        text = html.unescape(re.sub(r'<[^>]+>', '', text))
        text = re.sub(r'\n\s*\n+', '\n\n', text)
    print('--- body ---')
    print(text.strip())
print('--- attachments ---')
for i, p in enumerate(m.iter_attachments()):
    fn = os.path.basename(p.get_filename() or f'attachment-{i}')
    data = p.get_payload(decode=True)
    if data is None:  # e.g. attached message/rfc822
        data = p.get_content().as_bytes() if hasattr(p.get_content(), 'as_bytes') else bytes(str(p.get_content()), 'utf-8')
    path = os.path.join(out, fn)
    if os.path.exists(path):
        path = os.path.join(out, f'{i}-{fn}')
    open(path, 'wb').write(data)
    print(f'{path} ({len(data)} bytes, {p.get_content_type()})')
