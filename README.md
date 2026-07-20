# research site

Static academic site for Maurício de Oliveira, hosted on **GitHub Pages**.

- **Live URL:** https://mcdeoliveira.linearcontrol.info/
  (old `vicbee.net/research/` and `mcdeoliveira.github.io/research/` redirect here)
- **Source of truth:** this repo (`github.com/mcdeoliveira/research`).
- **Custom domain:** set via the `CNAME` file. DNS is a `CNAME` record
  `mcdeoliveira` → `mcdeoliveira.github.io` in the DigitalOcean zone for
  `linearcontrol.info`.

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
