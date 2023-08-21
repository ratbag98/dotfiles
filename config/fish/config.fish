if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cat=bat
    alias vi='nvim'
    alias vim='nvim'

    source ~/.asdf/asdf.fish
end
# test -e /Users/rob/.iterm2_shell_integration.fish ; and source /Users/rob/.iterm2_shell_integration.fish ; or true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/rob/miniconda3/bin/conda
    eval /Users/rob/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

