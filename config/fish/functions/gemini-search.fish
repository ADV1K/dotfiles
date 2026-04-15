function gemini-search --description "Search Gemini CLI sessions and optionally resume one"
    set -l query "$argv"

    # Prefer the built-in Gemini session list if available
    set -l sessions (gemini --list-sessions 2>/dev/null)

    if test $status -eq 0
        set -l selected

        if test -n "$query"
            set selected (printf '%s\n' $sessions | rg -i --color=never "$query" | fzf --ansi --prompt="Gemini session> ")
        else
            set selected (printf '%s\n' $sessions | fzf --ansi --prompt="Gemini session> ")
        end

        if test -z "$selected"
            return 1
        end

        # Extract the numeric session index from lines like:
        # 1. Fix bug in auth (2 days ago) [a1b2c3d4]
        set -l idx (string match -rg '^\s*([0-9]+)\.' -- $selected)[1]

        if test -n "$idx"
            echo "Resuming Gemini session $idx"
            gemini --resume $idx
            return
        end
    end

    # Fallback: search raw Gemini session files if list-sessions is unavailable
    set -l roots \
        ~/.gemini/sessions \
        ~/.gemini/tmp

    set -l files
    for root in $roots
        if test -d $root
            set files $files (fd . $root -t f 2>/dev/null)
        end
    end

    if test (count $files) -eq 0
        echo "No Gemini session files found"
        return 1
    end

    set -l match
    if test -n "$query"
        set match (rg -i -l "$query" $files 2>/dev/null | \
            fzf --preview 'rg -i --context 2 --color always "'$query'" {} | head -200' \
                --prompt="Gemini logs> ")
    else
        set match (printf '%s\n' $files | \
            fzf --preview 'tail -200 {}' --prompt="Gemini logs> ")
    end

    if test -n "$match"
        echo $match
    end
end
