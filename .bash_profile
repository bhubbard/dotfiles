# WP-CLI directory
export PATH=/Users/bhubbard/.wp-cli/bin:$PATH

# WP-CLI Bash completions
source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.bash

# WP-CLI Path for MAMP
export WP_CLI_PHP=/Applications/MAMP/bin/php/php5.4.10/bin/php

# Better Terminal Colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
