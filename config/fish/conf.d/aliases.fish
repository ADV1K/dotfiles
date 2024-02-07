# Variables
set EDITOR      nvim
set VISUAL      nvim
set BROWSER     google-chrome-stable
set PAGER       bat

# Aliases
alias ls        "eza --icons" 
alias ll        "eza --icons --long --header" 
alias la        "eza --icons --long --header --all" 
alias tree      "eza --icons --tree --level 2" 

alias rm        trash
alias rg        batgrep
alias vim       $EDITOR
alias cat       bat
alias man       "BAT_THEME='default' batman"
alias curl      curlie
alias grep      batgrep
alias grip      "grip --browser"
alias ncdu      "ncdu --color dark -x"
alias take      'mkdir -p $argv[1]; cd $argv[1];'

# kittens
alias icat      "kitten icat"
alias connect   "kitten ssh"
#alias ssh       "kitten ssh"

# Abbreviations
abbr s		    "source ~/.config/fish/config.fish"
abbr ef		    "$EDITOR ~/.config/fish/config.fish"
abbr ek		    "$EDITOR ~/.config/kitty/kitty.conf"
abbr et		    "$EDITOR ~/.config/tmux/tmux.conf"
abbr eh         "$EDITOR ~/.config/hypr/hyprland.conf"
abbr get	    "sudo pacman -S --needed"
abbr remove	    "sudo pacman -Rcns"

