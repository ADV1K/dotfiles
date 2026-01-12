source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/path.fish

# disable fish history, we will use atuin
set -g fish_history /dev/null

# Init shell apps
atuin init fish | source
#direnv hook fish | source
starship init fish | source
zoxide init fish --cmd j | source

function fish_greeting
	fortune -s
	fish_logo
end


#function envsource
#        for line in (command cat $argv | command grep -v '^#')
#              set item (string split -m 1 '=' $line)
#              set -gx $item[1] $item[2]
#              echo "Exported key $item[1]"
#            end
#end
