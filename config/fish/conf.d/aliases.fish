# Variables
set -gx PAGER                   bat
set -gx EDITOR                  nvim
set -gx VISUAL                  nvim
set -gx XDG_CONFIG_HOME         ~/.config
set -gx HOMEBREW_NO_AUTO_UPDATE 1

if test (uname) = "Darwin"
    set -gx BROWSER "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
else if test (uname) = "Linux"
    set -gx BROWSER "google-chrome-stable"
end

# Aliases
alias ls        "eza --icons --long --header --all --group-directories-first"
alias ll        "eza --icons --long --header" 
alias la        "eza --icons --long --header --all" 
alias tree      "eza --icons --tree --level 2" 
alias sudo      "sudo -E"

alias rm        trash
alias rg        'batgrep --terminal-width $COLUMNS'
alias vim       $EDITOR
alias cat       bat
alias man       batman
alias curl      curlie
alias diff      'PAGER=less delta'
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
abbr eg		"$EDITOR ~/.config/ghostty/config"
abbr ek		"$EDITOR ~/.config/kitty/kitty.conf"
abbr et		"$EDITOR ~/.config/tmux/tmux.conf"
abbr ey		"$EDITOR ~/.config/yabai/yabairc"
abbr es		"$EDITOR ~/.config/skhd/skhdrc"
abbr eh		"$EDITOR ~/.config/hypr/hyprland.conf"
abbr ev		"$EDITOR ~/.config/nvim/init.lua"
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
abbr ga           "git add"
abbr gd           "git diff"
abbr gr           "git restore"
abbr gs           "git status"
abbr gaa          "git add --all"
abbr gcm          "git commit -m"
abbr gca          "git commit --amend --no-edit"
abbr gco          "git checkout"
abbr gcb          "git checkout -b"
abbr gcl          "git clone"
abbr gpl          "git pull"
abbr gps          "git push"
abbr glog         "git log --oneline"

# Functions
function take
    mkdir -p $argv[1]
    cd $argv[1]
end

function flags
    if test (count $argv) -eq 0
        echo "usage: manflags <command>"
        return 1
    end

    set file (fd -a "^$argv[1]\." /usr/share/man /usr/local/share/man 2>/dev/null | head -n1)

    if test -z "$file"
        echo "manpage not found"
        return 1
    end

    awk '
    function flush() {
        if (flags != "") {
            gsub(/[ \t]+/, " ", desc)
            sub(/^ /, "", desc)
            printf "%s\t\t%s\n", flags, desc
        }
    }

    $1==".It" {
        flush()
        flags=""
        desc=""

        for (i=2;i<=NF;i++) {
            if ($i=="Fl") {
                i++
                if (flags=="")
                    flags="-"$i
                else
                    flags=flags", -" $i
            }
        }
        next
    }

    flags && $1 !~ /^\./ {
        desc = desc " " $0
    }

    END { flush() }
    ' $file | fzf --delimiter='\t' # --preview 'echo {}'
end

function ssm
    argparse 's/shell=' 'd/dir=' 'p/profile=' 'r/region=' -- $argv
    or return 1

    # Remaining arg = instance id
    set target $argv[1]

    if test -z "$target"
        echo "Usage: ssm <instance-id> [--dir DIR] [--shell SHELL] [--profile PROFILE] [--region REGION]"
        return 1
    end

    # Defaults
    if set -q _flag_dir
        set dir $_flag_dir
    else
        set dir '/'
    end

    if set -q _flag_shell
        set shell $_flag_shell
    else
        set shell /bin/bash
    end

    # Optional flags
    if set -q _flag_profile
        set aws_profile "--profile $_flag_profile"
    end

    if set -q _flag_region
        set aws_region "--region $_flag_region"
    end

    # Escape dir safely
    set dir_escaped (string escape -- $dir)

    aws ssm start-session \
        --target $target \
        --document-name AWS-StartInteractiveCommand \
        $aws_profile \
        $aws_region \
        --parameters "command=[\"cd $dir_escaped && exec $shell\"]"
end
