source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/path.fish

set -g fish_history ""
set fish_cursor_default block

# Init shell apps
mise activate | source
starship init fish | source
zoxide init fish --cmd j | source
source ~/.config/fish/atuin.fish
#direnv hook fish | source

function fish_greeting
	fortune -s
	fish_logo
end

# Keybinds
bind \cp _atuin_bind_up
bind \cr _atuin_search
#bind \cf forward-word
#bind \cb backward-word


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
