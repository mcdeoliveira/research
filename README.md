# research site

Static academic site for Maurício de Oliveira, hosted on **GitHub Pages**.

- **Live URL:** https://vicbee.net/research/ (also https://mcdeoliveira.github.io/research/)
- **Source of truth:** this repo (`github.com/mcdeoliveira/research`).

## Deploy

Edit the files, then:

```sh
make deploy      # git add + commit + push
```

GitHub Pages rebuilds automatically on push — the site is usually live within a
minute.

## Notes

- No server to maintain: GitHub serves everything over HTTPS on their CDN.
- Pages is configured to serve the repo root of the `main` branch.
- Replaces the old rsync-to-UCSD workflow (`renaissance.ucsd.edu` / `guitar.ucsd.edu`).
