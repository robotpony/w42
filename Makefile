.PHONY: build preview preview-all deploy publish

build:
	tools/publish.sh build

preview:
	tools/preview.sh

preview-all:
	tools/preview.sh all

deploy: publish

publish:
	tools/publish.sh
