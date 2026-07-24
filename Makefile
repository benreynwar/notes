.PHONY: all build diagrams serve clean

all: build

build: diagrams
	hugo --gc --minify

diagrams:
	./scripts/render-diagrams

serve: diagrams
	hugo server --buildDrafts

clean:
	rm -rf public resources/_gen

