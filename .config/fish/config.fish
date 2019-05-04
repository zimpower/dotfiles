set -x PATH $HOME/bin $PATH

abbr config '/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
abbr ccat 'highlight --out-format=xterm256'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test  -d  $HOME/anaconda3
  eval (eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv)
end
# <<< conda initialize <<<

