load_files=(
  /etc/bash_completion
  /usr/local/etc/bash_completion
  /usr/local/Library/Contributions/brew_bash_completion.sh
  /usr/local/etc/autojump.sh
)
for file in ${load_files[*]}; do
  [[ -f $file ]] && . $file
done

alias be="bundle exec"
alias ll="ls -al"

CLICOLOR=true
EDITOR=vim
ERL_AFLAGS="-kernel shell_history enabled"
PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
if [[ $(command -v ruby) ]]; then
  PATH=$(ruby -e 'puts ENV["PATH"].split(":").uniq.join(":")')
fi
PS1="\u@\h:\W"
[[ $(command -v __git_ps1) ]] && PS1=$PS1'$(__git_ps1 " (%s)")'
PS1="$PS1\\$ "
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

export CLICOLOR EDITOR ERL_AFLAGS PATH PS1

shopt -s histappend
HISTCONTROL="erasedups:ignoreboth"
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;} history -a"

if [[ $(command -v _known_hosts) ]]; then
  for cmd in csshX curl mosh nc ssh-copy-id ssh-keygen; do
    complete -F _known_hosts ${cmd}
  done
fi

[[ $(command -v rbenv) ]] && eval "$(rbenv init -)"

export PATH=/usr/local/heroku/bin:$PATH

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

[[ $- == *i* ]] && . /usr/local/opt/fzf/shell/completion.bash

. /usr/local/opt/fzf/shell/key-bindings.bash

[[ -e ~/.bashrc.private ]] && . ~/.bashrc.private
