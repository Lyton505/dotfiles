# on remote


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

###### custom functions

# to make a new dir and cd into it
mcd(){
	mkdir "$@" && cd "$@"
}


# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias copy="tee >(xclip -selection clipboard)"
alias zshconfig="vim ~/.zshrc"
alias omz="vim ~/.oh-my-zsh"
alias cls='clear'
alias apti='sudo apt install'
alias aptu='sudo apt update'
alias aptg='sudo apt upgrade'
alias apts='apt search'
alias aptr='sudo apt remove'
alias ai="ai -s"
alias main="tmux new -Asmain"
# alias libre="cd /home/lyton/Documents/GitRepos/LibreChat && docker compose up -d"
# alias libred="cd /home/lyton/Documents/GitRepos/LibreChat && docker compose down"
# alias spring='cd "/home/lyton/Documents/school-stuff/spring 2024/cs2201"'
#export QT_SCALE_FACTOR=1.4; obs
# unset ZSH_AUTOSUGGEST_USE_ASYNC
#unalias gts
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
#alias cp='cpv --progress --ignore-existing'
alias ls='ls --color=tty'
alias lsa='ls -a'
#export ANDROID_NDK_HOME=/home/lyton/Documents/custom-bin/android-ndk-r26d




# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Start the ssh agent
#
# since there is no gui, ssh-askpass should not be used
export SSH_ASKPASS=""
#
#
#export SSH_AUTH_SOCK=/tmp/ssh-agent.socket
#
#
export SSH_ASKPASS=
export GIT_ASKPASS=
#
# Start SSH agent and add a key
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" &> /dev/null
#    ssh-add ~/.ssh/id_ed25519
fi 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -t 1 ]; then
    export GPG_TTY=$(tty)
fi
