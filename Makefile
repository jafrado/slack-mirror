# transform slack_export by fetching files
# and rewriting links to local references
SHELL:=/bin/bash

FILELIST = $(shell cat files)

all:
	@echo "make extract to unzip"
	@echo "make install to run"
	@echo "make clean to cleanup"

extract:
	unzip slack_export.zip
	sudo chown -R $(USER) slack_export
	sudo chmod -R ug+rw slack_export
	find ./slack_export -name \*.json > files


install download:
	$(foreach json, $(FILELIST), $(shell ./slack-mirror $(json)))
	echo $(json)

clean:
	rm -fr slack_export
	rm -f files
