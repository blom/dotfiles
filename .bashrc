load_files=(
  /etc/bash_completion
  /usr/local/etc/bash_completion
  /usr/local/Library/Contributions/brew_bash_completion.sh
)
for file in ${load_files[*]}; do
  [[ -f $file ]] && . $file
done

EDITOR=vim
[[ $(command -v mvim) ]] && alias vim="mvim"
PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
if [[ $(command -v ruby) ]]; then
  PATH=$(ruby -e 'puts ENV["PATH"].split(":").uniq.join(":")')
fi
PS1="\u@\h:\W"
[[ $(command -v __git_ps1) ]] && PS1=$PS1'$(__git_ps1 " (%s)")'
PS1="$PS1\\$ "
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

export EDITOR PATH PS1

shopt -s histappend
HISTCONTROL="erasedups:ignoreboth"
PROMPT_COMMAND="history -a"

if [[ $(command -v _known_hosts) ]]; then
  for cmd in csshX curl mosh nc ssh-copy-id ssh-keygen; do
    complete -F _known_hosts ${cmd}
  done
fi

for file in ~/.rvm/scripts/rvm ~/.rvm/scripts/completion; do
  [[ -f $file ]] && . $file
done
