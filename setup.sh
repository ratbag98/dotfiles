ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/githelpers .githelpers
ln -s dotfiles/config .config
ln -s dotfiles/Brewfile Brewfile
ln -s dotfiles/tool-versions .tool-versions
ln -s dotfiles/default-mix-commands .default-mix-commands
mkdir -p ~/.git_template

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
