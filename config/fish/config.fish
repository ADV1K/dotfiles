source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/path.fish

# Init shell apps
atuin init fish | source
direnv hook fish | source
starship init fish | source
zoxide init fish --cmd j | source

function fish_greeting
end


function envsource
        for line in (command cat $argv | command grep -v '^#')
              set item (string split -m 1 '=' $line)
              set -gx $item[1] $item[2]
              echo "Exported key $item[1]"
            end
  end
