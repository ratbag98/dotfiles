tmux has-session -t $1
if [ $? != 0 ] 
then
    source ~/.tmux-sessions/$1 
fi
tmux attach -t $1
