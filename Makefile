
install: delve thefuck neovim

neovim:
	@brew install cmake python mono go nodejs
	@mkdir ~/.config/nvim || echo "neovim config dir exists"
	@curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ln -s $(pwd)/nvim.init.vim ~/.config/nvim/init.vim
	@nvim +PlugInstall

git:
	@git config --global branch.autosetupmerge always

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
