# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dstufft"

#Use vim key layout on the commandline
bindkey -v
#Map alternate escape key just as in vim
bindkey -M viins ‘jj’ vi-cmd-mode
#Add ctrl+r functionality
bindkey ‘^R’ history-incremental-search-backward

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git django ssh-agent vi-mode zsh-autosuggestions)

# User configuration
alias c="clear"
export PATH="/usr/local/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export JAVA_HOME="/cygdrive/c/Program Files/Java/jdk1.8.0_111"

# Change to repos directory
cd ~/repos

# aliases
alias c=clear
alias n="docker-compose run --rm django python manage.py"
alias dcb="docker-compose build"
alias dcu="docker-compose up -d"
alias t="docker-compose run --rm django pytest --flake8"
alias tc="docker-compose run --rm django coverage run -m pytest"
alias tch="docker-compose run --rm django coverage html"
alias mdb="node --inspect-brk=0.0.0.0:4200 node_modules/.bin/jest --runInBand"
alias mdbw="node --inspect-brk=0.0.0.0:4200 node_modules/.bin/jest --runInBand --watch"

# enable polling for gatsby develop
export CHOKIDAR_USEPOLLING=1

# workaround bug with gatsby build too many open files
ulimit -n 2560

# BEGIN ANSIBLE MANAGED BLOCK - pyenv
export PATH="/home/vagrant/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# END ANSIBLE MANAGED BLOCK - pyenv
# BEGIN ANSIBLE MANAGED BLOCK - nvm
export NVM_DIR="/home/vagrant/.nvm"
[ -s "/home/vagrant/.nvm/nvm.sh" ] && \. "/home/vagrant/.nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# END ANSIBLE MANAGED BLOCK - nvm
