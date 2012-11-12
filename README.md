dotfiles
========

    cd ~
    git clone git@github.com:ratbag98/dotfiles.git dotfiles

    ln -s dotfiles/gitconfig .gitconfig
    ln -s dotfiles/gitignore .gitignore
    ln -s dotfiles/githelpers .githelpers

    ln -s dotfiles/vimrc .vimrc
    ln -s dotfiles/vimrc .gvimrc

    git submodule init
    git submodule update
