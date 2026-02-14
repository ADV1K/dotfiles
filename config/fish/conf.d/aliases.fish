# Variables
set -gx EDITOR      nvim
set -gx VISUAL      nvim
set -gx BROWSER     google-chrome-stable
set -gx PAGER       bat
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# Aliases
alias ls        "eza --icons --long --header --all --group-directories-first"
alias ll        "eza --icons --long --header" 
alias la        "eza --icons --long --header --all" 
alias tree      "eza --icons --tree --level 2" 
alias sudo "sudo -E"

alias rm        trash
alias rg        'batgrep --terminal-width $COLUMNS'
alias vim       $EDITOR
alias cat       bat
alias man       batman
alias curl      curlie
alias diff      delta
alias grip      'grip --browser'
alias ncdu      'ncdu --color dark -x'
alias grep      'batgrep --terminal-width $COLUMNS'
alias python	python3

# kittens
alias icat      "kitten icat"
alias connect   "kitten ssh"
#alias ssh       "kitten ssh"

# Abbreviations
abbr s		"source ~/.config/fish/config.fish"
abbr ef		"$EDITOR ~/.config/fish/config.fish"
abbr ek		"$EDITOR ~/.config/kitty/kitty.conf"
abbr et		"$EDITOR ~/.config/tmux/tmux.conf"
abbr ey		"$EDITOR ~/.config/yabai/yabairc"
abbr es		"$EDITOR ~/.config/skhd/skhdrc"
abbr eh		"$EDITOR ~/.config/hypr/hyprland.conf"
abbr ev		"$EDITOR ~/.config/nvim/lua/custom/init.lua"
abbr tb		"nc termbin.com 9999"
abbr tfi	"terraform init -upgrade"
abbr tfv	"terraform validate"
abbr tfp	"terraform plan"
abbr tfa	"terraform apply"
abbr tfd	"terraform destroy"
abbr get	"sudo pacman -S --needed"
abbr remove	"sudo pacman -Rcns"

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

# Functions
function take
    mkdir -p $argv[1]
    cd $argv[1]
end
