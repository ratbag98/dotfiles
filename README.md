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

    ln -s dotfiles/tmux .tmux-sessions
    ln -s dotfiles/tmux.conf .tmux.conf

    ln -s dotfiles/lbdbrc .lbdbrc

    ln -s dotfiles/Brewfile Brewfile
    brew bundle install
    
    cd dotfiles

    # Vundle manages vim bundles for us:
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


    cd vim/ruby/command-t
    ruby extconf.rb 
    make

    For Pry:
        rvm gemset use global
        gem install pry pry-doc
    
