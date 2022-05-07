fish_add_path $HOME/.local/bin/
fish_add_path $HOME/programming/software/llvm-project/root/bin
bass source ~/.local/share/lunarg-vulkan-sdk/1.3.204.1/setup-env.sh
set -x LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$HOME/.local/lib/"

set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_QPA_PLATFORM wayland
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -x SDL_VIDEODRIVER wayland
set -x XDG_CURRENT_DESKTOP river
set -x XDG_SESSION_TYPE wayland
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x GDK_BACKEND wayland
set -x CC /home/robin/programming/software/llvm-project/root/bin/clang
set -x CXX /home/robin/programming/software/llvm-project/root/bin/clang++

# set gnome_schema org.gnome.desktop.interface
# gsettings set $gnome_schema gtk-theme Numix
# gsettings set $gnome_schema cursor-theme Breeze_Obsidian
# gsettings set $gnome_schema icon-theme Numix-Circle
# gsettings set $gnome_schema font-name "Cantarell 10"

gpgconf --launch gpg-agent

set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

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

function grep
    echo "use ripgrep"
end

function find
    echo "use fd"
end

function xq
    xbps-query $argv
end

function xr
    xbps-remove $argv
end
