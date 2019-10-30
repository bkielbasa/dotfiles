
install:
	ln -s ${PWD}/.vimrc ~
	ln -s ${PWD}/.zshrc ~
	ln -s ${PWD}/.vim ~

clean:
	rm -rf ~/.vimrc ~/.zshrc ~/.vim
