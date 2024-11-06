# on windows wsl


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

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

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


#Alias dependen
export RESUME_DIR="my_resume"

###### custom functions

# start webstorm from wsl
clion(){
	/mnt/c/Program\ Files/JetBrains/CLion\ 2024.2.2/bin/clion64.exe "$@"  &> /dev/null & disown
}

# start webstorm from wsl
storm() {
    /mnt/c/Program\ Files/JetBrains/WebStorm\ 2024.2.3/bin/webstorm64.exe "$@" &> /dev/null & disown
}

# to make a new dir and cd into it
mcd(){
	mkdir "$@" && cd "$@"
}

# copy current version of resume and open new copy in specialized dir for modification 
cv() {
    # Check if company name is provided
    if [ $# -eq 0 ]; then
        echo "Error: Please provide a company name."
        return 1
    fi

    # Combine all arguments into a single company name
    company="$@"

    # Replace spaces with underscores in the company name for the directory
    company_dir=${company:gs/ /_}

    date=$(date +%Y%m%d)
    base_dir="/home/lyton/Documents/CareerPrep/resume-db"
    target_dir="${base_dir}/company_specialized/${company_dir}_${date}"
    source_file="${base_dir}/lua-resume27/main.tex"

    # Create the directory
    mkdir -p "$target_dir"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory."
        return 1
    fi

    # Copy the main.tex file
    cp "$source_file" "$target_dir/"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to copy main.tex file."
        return 1
    fi

    # Change to the new directory
    cd "$target_dir" || return 1

    # Open VS Code in the new directory
    nohup cursor . > /dev/null 2>&1 &

    echo "CV environment for $company created successfully in $target_dir"
}

# aliases section


# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias stormb="nohup storm . > /dev/null 2>&1 &"
alias copy="tee >(xclip -selection clipboard)"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cls='clear'
alias jobDone='/usr/bin/notify-send "Command execution" "Done"'
alias apti='sudo apt install'
alias aptu='sudo apt update'
alias aptg='sudo apt upgrade'
alias apts='apt search'
alias aptr='sudo apt remove'
alias whome="cd /mnt/c/Users/ltmhl"
alias ai="ai -s"
alias main="tmux new -Asmain"
alias libre="cd /home/lyton/Documents/GitRepos/LibreChat && docker compose up -d"
alias libred="cd /home/lyton/Documents/GitRepos/LibreChat && docker compose down"
# alias spring='cd "/home/lyton/Documents/school-stuff/spring 2024/cs2201"'
#export QT_SCALE_FACTOR=1.4; obs
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# unset ZSH_AUTOSUGGEST_USE_ASYNC
#unalias gts
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
#alias cp='cpv --progress --ignore-existing'
alias ls='ls --color=tty'
alias lsa='ls -a'
# alias code='code -n'
#export ANDROID_NDK_HOME=/home/lyton/Documents/custom-bin/android-ndk-r26d
# alias spotify='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'
# alias joplin='Joplin'
# alias Joplin='Joplin --no-sandbox'
# alias cursor='~/Documents/custom-bin/cursor'



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Start the ssh agent
#
# since there is no gui, ssh-askpass should not be used
#export SSH_ASKPASS=""
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

#export GPG_TTY=$(tty)

# custom path
# export ANDROID_HOME=/mnt/c/Users/ltmhl/AppData/Local/Android/Sdk 
# check /mnt/c/Users/ltmhl/chocolatey first 
# export PATH=/mnt/c/Users/ltmhl/chocolatey/bin:$PATH
# export WSLENV=ANDROID_HOME/p
# export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=$ANDROID_HOME/emulator:$PATH
# export PATH=$ANDROID_HOME/tools:$PATH
# export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH="$PATH:$HOME/.bin"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# go to curr dir on new tab in wsl
# option 1: using powerlevel imp from https://github.com/romkatv/windows-terminal-zsh-integration
#source ~/windows-terminal-zsh-integration/windows-terminal-zsh-integration.plugin.zsh

#option 2: using windows method at https://archive.ph/g1wDz
# keep_current_path(){
#   printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
# }

# export PROMPT_COMMAND='printf "\e]9;9;%s\e\\" "$(wslpath -m "$PWD")"'

# keep_current_path(){
#   printf "\033]9;9;%s\033\\" "$(wslpath -w "$PWD")"
# }

# precmd_functions+=(keep_current_path)

# Windows Terminal directory tracking
if [[ -n "$WT_SESSION" ]]; then
  function precmd() {
    local DIR=$(wslpath -w "$PWD")
    echo -en "\e]9;9;$DIR\e\\"
  }
fi

if [ -t 1 ]; then
    export GPG_TTY=$(tty)
fi
