.DEFAULT_GOAL := all

all: aliases install vim

install:
	@bash install.sh
aliases:
	@cat aliases.sh >> ~/.zshrc
vim:
	@cat vimrc >> ~/.vimrc
