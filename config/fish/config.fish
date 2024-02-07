source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/path.fish

# Init shell apps
direnv hook fish | source
starship init fish | source
zoxide init fish --cmd j | source

# source homebrew; skip if not installed
#/opt/homebrew/bin/brew shellenv | source

#source ~/.asdf/asdf.fish
#source ~/.rye/env

function fish_greeting

end
