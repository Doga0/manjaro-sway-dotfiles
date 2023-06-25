# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

#export ZSH="$HOME/.oh-my-zsh"

export PATH=$HOME/.config/rofi/scripts:$PATH

#copy directory
function copydir {
  emulate -L zsh
  print -n $PWD | xclip -sel clip
}

#search history
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'

#copy file
function copyfile {
  emulate -L zsh
  xclip -sel clip $1
}

#copy buffer
copybuffer () {
  if which clipcopy &>/dev/null; then
    printf "%s" "$BUFFER" | xclip -sel clip
  else
    zle -M "xclip not found. Please make sure you have Oh My Zsh installed correctly."
  fi
}

zle -N copybuffer

bindkey -M emacs "^O" copybuffer
bindkey -M viins "^O" copybuffer
bindkey -M vicmd "^O" copybuffer


plugins=(copydir, history, copyfile, copybuffer)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


