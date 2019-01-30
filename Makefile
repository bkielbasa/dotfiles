.DEFAULT_GOAL := all

all: aliases install

install:
	@bash install.sh
aliases:
	@cat aliases.sh >> ~/.zshrc
