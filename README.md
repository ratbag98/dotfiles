dotfiles
========

    cd ~
    git clone git@github.com:ratbag98/dotfiles.git dotfiles

    ln -s dotfiles/gitconfig .gitconfig
    ln -s dotfiles/gitignore .gitignore
    ln -s dotfiles/githelpers .githelpers

    ln -s dotfiles/vimrc .vimrc
    ln -s dotfiles/vimrc .gvimrc
    ln -s dotfiles/vim   .vim

    ln -s dotfiles/gemrc .gemrc
    ln -s dotfiles/pryrc .pryrc
    ln -s dotfiles/irbrc .irbrc

    cd dotfiles

    git submodule init
    git submodule update

    cd vim/ruby/command-t
    ruby extconf.rb 
    make

    For Pry:
        rvm gemset use global
        gem install pry pry-doc
    
