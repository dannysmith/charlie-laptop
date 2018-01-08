# CharlieHR bash_profile
# This file was installed by http://github.com/charliehr/laptop
# Feel free to overwrite it with your own

# Set default editor
export EDITOR="vim"

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Set the PATH for rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# Ask for confirmation when running rm
alias rm='rm -i'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

################ Optimizations ################

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"


################ Aliases ################

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Ask when rm'ing files, for safety
alias rm="rm -i"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Git Shortcuts
alias git="hub"
alias g="git"
alias gpr="git pull --rebase"

# Bundle exec shortcut
alias be="bundle exec"

######### CharlieHR Aliases ##########

alias charlieup="bundle exec puma -p 3000 config.ru -w 1"
alias charlieup2="CONCISE_LOG=1 RAILS_LOG_TO_STDOUT=1bundle exec puma -p 3000 config.ru -w 1"
alias charliesq="redis-cli <<< 'flushall';bundle exec sidekiq -C config/sidekiq.yml"
alias charlietest_db="be rake db:drop db:create db:migrate RAILS_ENV=test"
alias charlie="cd ~/dev/Charlie/"

################ NPM/Node ################
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
