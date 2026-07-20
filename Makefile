.PHONY: deploy

# Publish the site. Edit files, then run `make deploy`.
# GitHub Pages rebuilds automatically on push (usually live within ~1 min).
# Site: https://vicbee.net/research/  (also mcdeoliveira.github.io/research/)
deploy:
	git add -A
	git commit -m "Update site" || echo "Nothing to commit"
	git push
