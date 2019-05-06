apps:
	brew install git vim zsh
	brew install getantibody/tap/antibody
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dotfiles:
	rm -rf ~/.zsh_plugins.txt && ln -s Projects/dotfiles/.zsh_plugins.txt ~
	rm -rf ~/.vimrc && ln -s Projects/dotfiles/.vimrc ~
	rm -rf ~/.zshrc && ln -s Projects/dotfiles/.zshrc ~
	rm -rf ~/.tmux.conf && ln -s Projects/dotfiles/.tmux.conf ~

