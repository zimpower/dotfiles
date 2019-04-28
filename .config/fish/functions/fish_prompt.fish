set fish_prompt_pwd_dir_length 0

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch 242
set __fish_git_prompt_color_dirtystate FCBC47
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream cyan

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '⇢'
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo magenta
  else
    echo red
  end
end

function fish_prompt
  set -l last_status $status

  _print_in_color "\n"$USER red
  _print_in_color "@"(prompt_hostname) yellow
  _print_in_color " "(prompt_pwd) blue

  __fish_git_prompt " %s"

  _print_in_color "\n❯ " (_prompt_color_for_status $last_status)
end

# function fish_prompt --description 'Write out the prompt'
#     set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
#     set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
#     set -l prompt_symbol ''
#   switch "$USER"
#       case root toor
#             set prompt_symbol '#'
#         case '*'
#             set prompt_symbol '$'
#    end
#    printf "[%s@%s %s%s%s]%s " $USER (prompt_hostname) (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol
#end

