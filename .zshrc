#-- Set zsh configuration folder --#
ZDOTDIR=~/.config/zsh

for i in $ZDOTDIR/{functions,aliases}; do
. $i || echo "Could not source $i"
done 

#-- Git-flow makes life easier --#
if [ -f /etc/zsh/git-flow-completion.zsh ]; then
    . /etc/zsh/git-flow-completion.zsh
fi

#-- Some options --#
setopt appendhistory SHARE_HISTORY histignorealldups 
setopt autocd extendedglob longlistjobs nomatch nohup correct
unsetopt beep notify
bindkey -v

#precmd () {print -Pn "\e]0; %~\a"}

precmd ()       {
#    echo -ne "\ekzsh\e\\"
print -Pn "\e]0;%~\a"
} # xterm

    preexec () {
#      local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
#      echo -ne "\ek$CMD\e\\"
      print -Pn "\e]0;$1\a"  # xterm
    }


#-- zstyle comletions --#
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache
zstyle ':completion:*:rm:*' ignore-line yes

zstyle :compinstall filename '/home/intrntbrn/.zshrc'
autoload -Uz compinit 
compinit

#-- Autoloads --#
autoload -U colors && colors
zmodload -i zsh/complist

##-- Key Bindings --#
#bindkey "^[[A" history-search-backward
#bindkey "^[[B" history-search-forward
#bindkey "\e[1~" beginning-of-line       # home
#bindkey "\e[4~" end-of-line             # end
#bindkey "\e[5~" beginning-of-history # PageUp
#bindkey "\e[6~" end-of-history # PageDown
#bindkey "\e[2~" quoted-insert # Ins
#bindkey "\e[3~" delete-char # Del
#bindkey "\e[A"  up-line-or-search       # cursor up
#bindkey "\e[B"  down-line-or-search     # <ESC>-
#bindkey '^xp'   history-beginning-search-backward
#bindkey '^xP'   history-beginning-search-forward
## rxvt
#bindkey "\e[7~" beginning-of-line       # home
#bindkey "\e[8~" end-of-line             # end


#-- Prompt --# 
PS1="%{$fg[blue]%}[%{$fg[white]%}%~%{$fg[blue]%}]
%{$fg[blue]%}>%{$fg[cyan]%}>%{$fg[white]%}>%{$reset_color%} "

#-- Right prompt --#
RPS1="%{$(echotc UP 1)%}%{$fg[white]%}%T%{$reset_color%}%{$(echotc DO 1)%}"


#-- Command Coloring --#
. ~/.config/zsh/scripts/live-command-coloring.sh

export PATH=$PATH:/home/intrntbrn/toolchain/schimmlertools/bin
