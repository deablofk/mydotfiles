WORDCHARS=''

# PLUGINS
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search.zsh

# ZSH HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# COMPLETION MODE
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# if [ $(date +'%j') != $(date -r ~/.zcompdump +'%j') ]; then # compile once per day
compinit
# else
    # compinit -C
# fi
_comp_options+=(globdots)
# case insensitive completion only suggests when no case-sensitive matches is present
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# GIT 
autoload -Uz vcs_info
setopt PROMPT_SUBST
precmd() {
    vcs_info
}

# FUZY FIND CTRL-R
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PROMPT ((R)IGHT)
PROMPT='%F{yellow}%c ➤ %F{reset}%f'
RPROMPT='%F{cyan}${vcs_info_msg_0_}'


# BIND THE KEYBINDS TO EMACS INSTEAD OF DEFAULT VI
bindkey -e

# bindkey -v
# [PageUp] - Up a line of history
bindkey -M emacs "^[[5~" up-line-or-history
# [PageDown] - Down a line of history
bindkey -M emacs "^[[6~" down-line-or-history
# Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M emacs "^[[A" up-line-or-beginning-search
# Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M emacs "^[[B" down-line-or-beginning-search
# [Home] - Go to beginning of line
bindkey -M emacs "^[[H" beginning-of-line
# [End] - Go to end of line
bindkey -M emacs '^[[F' end-of-line
# [Shift-Tab] - move through the completion menu backwards
bindkey -M emacs "^[[Z" reverse-menu-complete
# [Delete] - delete forward
bindkey -M emacs "^[[3~" delete-char
# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region                            
# [Esc-l] - run command: ls
bindkey -s '\el' 'ls\n'                   
# [Esc-c] - run command: clear
bindkey -s '\ec' 'clear\n'
# [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward     
# [Space] - don't do history expansion
bindkey ' ' magic-space                           
# EDIT THE COMMAND IN $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^[n' edit-command-line

# FZF completion
source /usr/share/doc/fzf/examples/key-bindings.zsh


# PROGRAMS EXPORT
export PATH=~/.local/bin:~/.config/emacs/bin:~/idea/bin/:~/anaconda3/bin/:~/.local/share/coursier/bin:/home/cwby/.dotnet:$PATH
export EDITOR='nvim'
export READER='zathura'
export LS_COLORS="di=1;33:"

# PROGRAMS ALIASES
alias yt-dlp='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
# alias cat='bat'
alias ls="ls --color -h -F --group-directories-first"
alias _="sudo "
alias lf="~/.config/lf/lfub"
alias vim="nvim"
alias ssh="TERM=xterm ssh"

# DEBIAN ALIASES
alias "apt search"="apt search --names-only"

# MATH FUNCTION TO BE USED AS PROGRAM
math () {
    echo "result of $@: $(($@))"
}

# GIT ALIASES
source ~/.config/zsh/git.plugin.zsh

# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


export _JAVA_AWT_WM_NONREPARENTING=1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cwby/.sdkman"
[[ -s "/home/cwby/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cwby/.sdkman/bin/sdkman-init.sh"
export DOTNET_ROOT=$HOME/.dotnet
