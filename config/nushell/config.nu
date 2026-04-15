# =============================================================================
# Nushell Config — converted from fish config
# =============================================================================

# -----------------------------------------------------------------------------
# PATH
# -----------------------------------------------------------------------------
$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend [
        /usr/local/sbin
        /usr/lib/go/misc/wasm
        ($env.HOME | path join go bin)
        ($env.HOME | path join .config tmux plugins t-smart-tmux-session-manager bin)
        ($env.HOME | path join .fly bin)
        ($env.HOME | path join .cargo bin)
        ($env.HOME | path join .yarn bin)
        ($env.HOME | path join .asdf bin)
        ($env.HOME | path join .local bin)
        ($env.HOME | path join .antigravity antigravity bin)
        ($env.HOME | path join .rustup toolchains stable-x86_64-apple-darwin bin)
        ($env.HOME | path join .local share nvim site)
    ]
    | uniq
)

# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
$env.EDITOR                = "nvim"
$env.VISUAL                = "nvim"
#$env.BROWSER               = google-chrome-stable
$env.PAGER                 = "bat"
$env.HOMEBREW_NO_AUTO_UPDATE = "1"

# Disable history (equivalent to set -g fish_history "")
$env.HISTFILE = "/dev/null"

# -----------------------------------------------------------------------------
# Shell Integrations (mise, starship, zoxide/j, atuin)
# -----------------------------------------------------------------------------
# NOTE: Run these once to generate the Nu integration files:
#   mise activate nu    | save -f ~/.config/nushell/mise.nu
#   starship init nu    | save -f ~/.config/nushell/starship.nu
#   zoxide init nushell --cmd j | save -f ~/.config/nushell/zoxide.nu
#   atuin init nu       | save -f ~/.config/nushell/atuin.nu

#source ~/.config/nushell/mise.nu
#source ~/.config/nushell/starship.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/atuin.nu

# -----------------------------------------------------------------------------
# Aliases — ls / eza
# -----------------------------------------------------------------------------
alias ls   = eza --icons --long --header --all --group-directories-first
alias ll   = eza --icons --long --header
alias la   = eza --icons --long --header --all
alias tree = eza --icons --tree --level 2

# -----------------------------------------------------------------------------
# Aliases — safety / replacements
# -----------------------------------------------------------------------------
alias sudo   = sudo -E -s
alias rm     = trash
alias vim    = nvim
alias cat    = bat
alias man    = batman
alias curl   = curlie
alias diff   = delta
alias grip   = grip --browser
alias ncdu   = ncdu --color dark -x
alias python = python3

# rg / grep with terminal width — Nu exposes terminal size natively
#alias rg   = 'batgrep $"--terminal-width=(term size).columns"'
#alias grep = 'batgrep $"--terminal-width=(term size).columns"'

# -----------------------------------------------------------------------------
# Abbreviations → Nu aliases
# (Nu has no abbreviation expansion; aliases are the closest equivalent)
# -----------------------------------------------------------------------------

# Config shortcuts — using $env.EDITOR
#alias s  = source ~/.config/nushell/config.nu
alias ef = nu -c $"($env.EDITOR) ~/.config/nushell/config.nu"
alias ek = nu -c $"($env.EDITOR) ~/.config/kitty/kitty.conf"
alias et = nu -c $"($env.EDITOR) ~/.config/tmux/tmux.conf"
alias ey = nu -c $"($env.EDITOR) ~/.config/yabai/yabairc"
alias es = nu -c $"($env.EDITOR) ~/.config/skhd/skhdrc"
alias eh = nu -c $"($env.EDITOR) ~/.config/hypr/hyprland.conf"
alias ev = nu -c $"($env.EDITOR) ~/.config/nvim/lua/custom/init.lua"

# Misc
alias tb = ^nc termbin.com 9999

# Terraform
alias tfi = terraform init -upgrade
alias tfv = terraform validate
alias tfp = terraform plan
alias tfa = terraform apply
alias tfd = terraform destroy

# Package management (Arch)
alias get    = sudo pacman -S --needed
alias remove = sudo pacman -Rcns

# -----------------------------------------------------------------------------
# Git Abbreviations → aliases
# -----------------------------------------------------------------------------
alias g   = git
alias gs  = git status
alias ga  = git add
alias gaa = git add --all
alias gcm = git commit -m
alias gca = git commit --amend
alias gco = git checkout
alias gcb = git checkout -b
alias gcl = git clone
alias gpl = git pull
alias gps = git push

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

# take: mkdir + cd in one step (idiomatic Nu)
def --env take [dir: path] {
    mkdir $dir
    cd $dir
}

# -----------------------------------------------------------------------------
# Zed terminal — auto-attach tmux (equivalent to fish ZED_TERM block)
# -----------------------------------------------------------------------------
if "ZED_TERM" in $env {
    ^tmux new -As zed
}

# -----------------------------------------------------------------------------
# Key Bindings
# (Atuin binds Ctrl-R for history search automatically via atuin.nu)
# Additional Vi/emacs bindings can be set in the keybindings block below.
# -----------------------------------------------------------------------------
$env.config = {
    show_banner: true          
    history: {
        max_size:    100_000
        sync_on_enter: true
        file_format: sqlite     # structured history — a Nu-native advantage
        isolation:   false
    }
    cursor_shape: {
        emacs:    block         # fish: set fish_cursor_default block
        vi_normal: block
        vi_insert: line
    }
    edit_mode: emacs
#keybindings: [
        # Ctrl-P → atuin up-arrow history (mirrors fish bind \cp _atuin_bind_up)
#        {
#            name:     atuin_up
#            modifier: control
#            keycode:  char_p
#            mode:     [emacs, vi_normal, vi_insert]
#            event:    { send: uppercasemenu }   # atuin hooks this via its integration
#        }
#    ]
#    # Catppuccin Mocha colour theme (mirrors fish colour variables)
    color_config: {
        separator:               "#6c7086"   # fish_color_autosuggestion / overlay0
        leading_space:           "#6c7086"
        header:                  "#89b4fa"   # fish_color_command / blue
        empty:                   "#6c7086"
        bool:                    "#f5c2e7"   # fish_color_operator / pink
        int:                     "#fab387"   # fish_color_end / peach
        filesize:                "#a6e3a1"   # fish_color_option / green
        duration:                "#f9e2af"   # fish_color_cwd / yellow
        date:                    "#94e2d5"   # fish_color_user / teal
        range:                   "#cdd6f4"   # fish_color_normal / text
        float:                   "#fab387"
        string:                  "#a6e3a1"   # fish_color_quote / green
        nothing:                 "#7f849c"   # fish_color_comment / surface2
        binary:                  "#eba0ac"   # fish_color_escape / maroon
        cellpath:                "#f5c2e7"
        row_index:               { fg: "#f9e2af" attr: b }
        record:                  "#cdd6f4"
        list:                    "#cdd6f4"
        block:                   "#89b4fa"
        hints:                   "#6c7086"
        search_result:           { fg: "#f38ba8" bg: "#313244" }  # fish_color_search_match
        shape_and:               { fg: "#f38ba8" attr: b }
        shape_binary:            { fg: "#eba0ac" attr: b }
        shape_block:             { fg: "#89b4fa" attr: b }
        shape_bool:              "#f5c2e7"
        shape_closure:           { fg: "#94e2d5" attr: b }
        shape_custom:            "#a6e3a1"
        shape_datetime:          { fg: "#94e2d5" attr: b }
        shape_directory:         "#89b4fa"
        shape_external:          "#a6e3a1"
        shape_external_resolved: "#94e2d5"
        shape_externalarg:       "#a6e3a1"
        shape_filepath:          "#89b4fa"
        shape_flag:              { fg: "#89b4fa" attr: b }
        shape_float:             { fg: "#fab387" attr: b }
        shape_garbage:           { fg: "#f38ba8" bg: "#313244" attr: b }
        shape_glob_interpolation: { fg: "#94e2d5" attr: b }
        shape_globpattern:       { fg: "#94e2d5" attr: b }
        shape_int:               { fg: "#fab387" attr: b }
        shape_internalcall:      { fg: "#89b4fa" attr: b }
        shape_keyword:           { fg: "#f38ba8" attr: b }
        shape_list:              { fg: "#94e2d5" attr: b }
        shape_literal:           "#89b4fa"
        shape_match_pattern:     "#a6e3a1"
        shape_matching_brackets: { attr: u }
        shape_nothing:           "#7f849c"
        shape_operator:          "#f5c2e7"
        shape_or:                { fg: "#f38ba8" attr: b }
        shape_pipe:              { fg: "#f38ba8" attr: b }
        shape_range:             { fg: "#f9e2af" attr: b }
        shape_raw_string:        { fg: "#f2cdcd" attr: b }
        shape_record:            { fg: "#94e2d5" attr: b }
        shape_redirection:       "#f5c2e7"
        shape_signature:         { fg: "#a6e3a1" attr: b }
        shape_string:            "#a6e3a1"
        shape_string_interpolation: { fg: "#94e2d5" attr: b }
        shape_table:             { fg: "#89b4fa" attr: b }
        shape_vardecl:           { fg: "#89b4fa" attr: u }
        shape_variable:          "#f2cdcd"   # fish_color_param / flamingo
    }
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    rm: {
        always_trash: true      # mirrors `alias rm = trash`
    }
    table: {
        mode: rounded
        index_mode: always
        show_empty: true
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
        }
    }
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: fuzzy        # fuzzy completion — Nu-native, no plugin needed
    }
    #filesize: {
    #}
    shell_integration: {
        osc2:  true
        osc7:  true
        osc8:  true
        osc9_9: false
        osc133: true
        osc633: true
        reset_application_mode: true
    }
}
