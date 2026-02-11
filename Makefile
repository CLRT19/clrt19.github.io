all: assets/main.css index.html

assets/main.css: styles/main.scss
	@mkdir -p assets
	sassc $< $@

index.html: index.rkt pubs.rkt lib.rkt
	racket $< > $@

serve:
	python3 -m http.server --bind localhost 6061

.PHONY: all serve
