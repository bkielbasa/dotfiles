
install: apps delve thefuck

apps:
	@brew install iterm2 hugo zsh tmux thefuck npm spotify raycast dropbox go gpg

git:
	@git config --global branch.autosetupmerge always
	@git config --global commit.gpgsign true

delve:
ifeq (, $(shell which dlv))
		@echo "👉 installing debugger"
		@go get -u github.com/go-delve/delve/cmd/dlv
else
		@echo " 👍 Delve already installed"
endif

thefuck:
ifeq (, $(shell which thefuck))
	@echo "👉 installing the fuck"
	@sudo pip3 install thefuck
else
		@echo " 👍 thefuck already installed"
endif

brew:
	@brew install ripgrep
