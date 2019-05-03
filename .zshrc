# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# THEME SETTINGS
# THEME
P9K_MODE='nerdfont-complete'
P9K_PROMPT_ON_NEWLINE=true
P9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
P9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

P9K_DIR_SHORTEN_LENGTH=2

######
# Antibody

# Static loading
source ~/.zsh_plugins.sh

# To update, run:
# antibody update

# To load (after e.g. including more plugins), run:
# antibody bundle < ~/.adamaltmejd/zsh-plugins > ~/.zsh_plugins.sh

######
# Aliases and functions
source ~/.adamaltmejd/aliases
source ~/.adamaltmejd/functions
