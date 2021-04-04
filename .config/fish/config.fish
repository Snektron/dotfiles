fish_add_path $HOME/.local/bin/

function fish_user_key_bindings
    bind \ch backward-kill-word
end

function config
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end

function clip
    xclip -selection c
end

config config status.showUntrackedFiles no

if status is-interactive
    tabs -4
end
