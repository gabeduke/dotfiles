_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run:
	ansible-playbook -i $(_DIR)/hosts $(_DIR)/dev.yaml --limit localhost -K
