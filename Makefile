.DEFAULT_GOAL := help

.PHONY: help
help: ## Show the help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0;33m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: setup
setup: brew ## Setup the environment

brew: ## Install dependencies with brew
	@echo "Install dependencies with brew"
	@brew update
	@brew tap homebrew/bundle
	@brew bundle --file ./Brewfile

.PHONY: doctor
doctor: ## Run the doctor script
	@./scripts/doctor.sh

.PHONY: dumpb
dumpb: ## Dump the brew dependencies
	@brew bundle dump --force --file ./Brewfile
