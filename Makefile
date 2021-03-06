_BOOTSTRAP := $(CURDIR)/.bootstrap

.DEFAULT_GOAL := help
.PHONY: boostrap help init

##@ System

init:
	ansible-galaxy install -r $(_BOOTSTRAP)/requirements.yml

bootstrap: init ## Bootstrap system packages
	ansible-playbook -i $(_BOOTSTRAP)/hosts $(_BOOTSTRAP)/dev.yaml --limit localhost -K --verbose

##@ Helpers

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

