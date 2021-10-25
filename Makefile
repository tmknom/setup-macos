# If this variable is not set, the program /bin/sh is used as the shell.
#
# The -e flag causes bash with qualifications to exit immediately if a command it executes fails.
# The -u flag causes bash to exit with an error message if a variable is accessed without being defined.
# The -o pipefail option causes bash to exit if any of the commands in a pipeline fail.
# The -c flag is  how make passes the script to be executed to bash.
SHELL := /bin/bash -eu -o pipefail -c

# This option causes make to display a warning whenever an undefined variable is expanded.
MAKEFLAGS += --warn-undefined-variables

# Disable any builtin rules and variables, so speedup a bit.
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
.SUFFIXES:

# Sets the default goal to be used if no targets were specified on the command line.
.DEFAULT_GOAL := help

#
# Install
#
.PHONY: install-homebrew
install-homebrew: ## install homebrew
	./scripts/install_homebrew.sh

.PHONY: install-cli
install-cli: ## install cli by homebrew
	./scripts/install_cli.sh

.PHONY: install-asdf
install-asdf: ## install cli tools by asdf
	./scripts/install_asdf.sh

.PHONY: install-cask
install-cask: ## install gui tools by cask
	./scripts/install_cask.sh

.PHONY: install-zinit
install-zinit: ## install zinit
	./scripts/install_zinit.sh

#
# ShellScript
#
.PHONY: test-shell
test-shell: ## test shell by shellcheck
	@for file in $(SHELL_FILES); do $(call shellcheck,$${file}); done

.PHONY: format-shell
format-shell: ## format shell by shfmt
	@for file in $(SHELL_FILES); do $(call shfmt,$${file}); done

.PHONY: test-shell-all
test-shell-all: ## test all shell by shellcheck
	@for file in $(ALL_SHELL_FILES); do $(call shellcheck,$${file}); done

.PHONY: format-shell-all
format-shell-all: ## format all shell by shfmt
	@for file in $(ALL_SHELL_FILES); do $(call shfmt,$${file}); done

define shellcheck
	echo shellcheck: $${file}; \
	$(DOCKER_RUN) koalaman/shellcheck:stable "${1}" || true
endef

define shfmt
	echo shfmt: $${file}; \
	$(DOCKER_RUN) mvdan/shfmt -i 2 -ci -bn -w "${1}" || true
endef

SHELL_FILES ?= $(shell git diff --name-only main | grep '.sh')
ALL_SHELL_FILES ?= $(shell find . -name '*.sh')

#
# Help
#
.PHONY: help
help: ## show help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
