SHELL := bash

.PHONY: update
update:
	@$(CURDIR)/scripts/update.sh

.PHONY: switch
switch:
	darwin-rebuild switch --flake .\#tony
