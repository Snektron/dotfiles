fish_add_path $HOME/.local/bin/
set -x LD_LIBRARY_PATH $HOME/.local/lib/
bass source ~/.local/share/lunarg-vulkan-sdk/1.2.198.1/setup-env.sh

set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_QPA_PLATFORM wayland
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -x SDL_VIDEODRIVER wayland
set -x XDG_CURRENT_DESKTOP river
set -x XDG_SESSION_TYPE wayland
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x GDK_BACKEND wayland

set gnome_schema org.gnome.desktop.interface
gsettings set $gnome_schema gtk-theme Numix
gsettings set $gnome_schema cursor-theme Breeze_Obsidian
gsettings set $gnome_schema icon-theme Numix-Circle
gsettings set $gnome_schema font-name "Cantarell 10"

eval (ssh-agent -c) >/dev/null

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
