source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/path.fish

# Init shell apps
atuin init fish | source
direnv hook fish | source
starship init fish | source
zoxide init fish --cmd j | source

function fish_greeting
end
