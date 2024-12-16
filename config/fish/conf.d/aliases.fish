# Variables
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
set -gx EDITOR      nvim
set -gx VISUAL      nvim
# set -gx BROWSER     google-chrome-stable
set -gx PAGER       bat
||||||| Stash base
set EDITOR      nvim
set VISUAL      nvim
||||||| Stash base
set EDITOR      nvim
set VISUAL      nvim
=======
set -x EDITOR   nvim
set -x VISUAL   nvim
>>>>>>> Stashed changes
||||||| Stash base
set EDITOR      nvim
set VISUAL      nvim
=======
set -x EDITOR   nvim
set -x VISUAL   nvim
>>>>>>> Stashed changes
set BROWSER     google-chrome-stable
set PAGER       bat
=======
set -x EDITOR   nvim
set -x VISUAL   nvim
set BROWSER     google-chrome-stable
set PAGER       bat
>>>>>>> Stashed changes

alias sudo "sudo -E"

alias sudo "sudo -E"

alias sudo "sudo -E"

# Aliases
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
alias ls        "eza --icons --long --header --group-directories-first"
||||||| Stash base
alias ls        "eza --icons" 
=======
alias ls        "eza --icons --long --header --all --group-directories-first"
>>>>>>> Stashed changes
||||||| Stash base
alias ls        "eza --icons" 
=======
alias ls        "eza --icons --long --header --all --group-directories-first"
>>>>>>> Stashed changes
||||||| Stash base
alias ls        "eza --icons" 
=======
alias ls        "eza --icons --long --header --all --group-directories-first"
>>>>>>> Stashed changes
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
alias diff      delta
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
abbr ey         "$EDITOR ~/.config/yabai/yabairc"
abbr es         "$EDITOR ~/.config/skhd/skhdrc"
abbr eh         "$EDITOR ~/.config/hypr/hyprland.conf"
abbr ev         "$EDITOR ~/.config/nvim/lua/custom/init.lua"
abbr tb         "nc termbin.com 9999"
abbr get	    "sudo pacman -S --needed"
abbr remove	    "sudo pacman -Rcns"

# Git
abbr g            "git"
abbr gs           "git status"
abbr ga           "git add"
abbr gaa          "git add --all"
abbr gcm          "git commit -m"
abbr gca          "git commit --amend"
abbr gco          "git checkout"
abbr gcb          "git checkout -b"
abbr gcl          "git clone"
abbr gpl          "git pull"
abbr gps          "git push"
