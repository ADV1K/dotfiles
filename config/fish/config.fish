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

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
#     eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
#         . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
#     end
# end
# # <<< conda initialize <<<
#
# conda deactivate
# # conda activate

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/advik/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
