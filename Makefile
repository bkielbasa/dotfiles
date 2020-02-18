
install: install-vim-plugins  delve thefuck
	@echo "👉 Installing .vimrc file"
	@ln -s ${PWD}/.vimrc ~ 2> /dev/null || echo " 👍 .vimrc already exists"
	@echo "source $(shell pwd)/shell.sh" >> ~/.zshrc

install-vim-plugins:
	@echo "👉 installing vim plugins..."
	@git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go 2> /dev/null || echo " 👍 vim-go already installed"
	@git clone git@github.com:junegunn/fzf.git ~/.vim/bundle/fzf 2> /dev/null || echo " 👍 fzf already installed"
	@git clone git@github.com:junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim 2> /dev/null || echo " 👍 fzf.vim already installed"
	@git clone https://tpope.io/vim/surround.git ~/.vim/bundle/vim-surround 2> /dev/null || echo " 👍 vim-surround already installed"
	@git clone git@github.com:sheerun/vim-polyglot.git ~/.vim/bundle/vim-polyglot 2> /dev/null || echo " 👍 vim-polyglot already installed"
	@git clone git@github.com:SirVer/ultisnips.git ~/.vim/bundle/ultisnips  2> /dev/null || echo " 👍 ultisnips already installed"
	@git clone git@github.com:honza/vim-snippets.git ~/.vim/bundle/vim-snippets 2>/dev/null || echo " 👍 vim-snippets already installed"

clean:
	@echo "cleaning files"
	@[ -f ~/.vimrc ] && mv ~/.vimrc  ~/.vimrc.back || true
	@[ -d ~/.vim ] && mv ~/.vim ~/.vim.back || true

delve:
ifeq (, $(shell which dlv))
		@echo "👉 installing debugger";;
		@go get -u github.com/go-delve/delve/cmd/dlv;;
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
