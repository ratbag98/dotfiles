function config --wraps='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --description 'alias config=/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  /usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
        
end
