# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux git brew coffee github gnu-utils history-substring-search node npm  urltools vi-mode lein rails rails3 gem rake rvm ruby colorize)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:~/bin:/usr/local/share/python3

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


export PATH=$PATH:/usr/local/share/npm/bin

export PATH=~/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


[[ -s /home/logan/.nvm/nvm.sh ]] && . /home/logan/.nvm/nvm.sh # This loads NVM

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias note=/home/logan/bin/note-thing/note
alias noteread=/home/logan/bin/note-thing/noteread
alias noteclean=/home/logan/bin/note-thing/noteclean

source ~/.profile
xmodmap /home/lmohseni/.keyswap
[[ -s /home/lmohseni/.nvm/nvm.sh ]] && . /home/lmohseni/.nvm/nvm.sh # This loads NVM

function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function google() { firefox "http://www.google.com/search?hl=en#q="`encode $@`"";}
function wiki() { firefox "http://en.wikipedia.org/w/index.php?search="`encode $@`"" ;}

