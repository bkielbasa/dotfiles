
install: clean  delve thefuck
	@echo "Installing directories"
	@ln -s ${PWD}/.vimrc ~
	@ln -s ${PWD}/.zshrc ~
	@ln -s ${PWD}/.vim ~

clean:
	@echo "cleaning files"
	@[ -f ~/.vimrc ] && mv ~/.vimrc  ~/.vimrc.back || true
	@[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.back || true
	@[ -d ~/.vim ] && mv ~/.vim ~/.vim.back || true

delve:
ifeq (, $(shell which dlv))
		@echo "installing debugger";;
		@go get -u github.com/go-delve/delve/cmd/dlv;;
else
		@echo "Delve already installed"
endif

thefuck:
ifeq (, $(shell which thefuck))
	@echo "installing the fuck"
	@sudo pip3 install thefuck
else
		@echo "thefuck already installed"
endif
