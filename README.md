# research site

Static academic site for Maurício de Oliveira, hosted on **GitHub Pages**.

- **Live URL:** https://mcdeoliveira.linearcontrol.info/
  (`mcdeoliveira.github.io/research/` redirects here)
- **Source of truth:** this repo (`github.com/mcdeoliveira/research`).
- **Custom domain:** set via the `CNAME` file. DNS is a `CNAME` record
  `mcdeoliveira` → `mcdeoliveira.github.io` in the DigitalOcean zone for
  `linearcontrol.info`.

## Deploy

Edit the files, then:

```sh
git add -A && git commit -m "Update site" && git push
```

GitHub Pages rebuilds automatically on push — the site is usually live within a
minute.

## Layout

- `index.html` — landing page.
- `style.css` — single shared stylesheet for every page (landing + courses).
- `courses/<course>/` — one folder per course; `courses/index.html` is the
  Teaching index.
- An analytics tag is included in the `<head>` of each page.

## Notes

- No server to maintain: GitHub serves everything over HTTPS on their CDN.
- Pages serves the repo root of the `main` branch.
- Replaces the old rsync-to-UCSD workflow (`renaissance.ucsd.edu` / `guitar.ucsd.edu`).
