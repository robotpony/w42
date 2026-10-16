.PHONY: build check dry-run preview preview-all deploy publish

build:
	tools/publish.sh build

check:
	tools/publish.sh check

dry-run:
	tools/publish.sh dry-run

preview:
	tools/preview.sh

preview-all:
	tools/preview.sh all

deploy: publish

publish:
	tools/publish.sh
