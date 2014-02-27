#!/usr/bin/env bash

config_dir="$HOME/.vim-tt"

[ -z "$VUNDLE_URI" ] && VUNDLE_URI="https://github.com/gmarik/vundle.git"
[ -z "$CONFIG_URI" ] && CONFIG_URI="https://github.com/TamerTas/vim-config.git"

msg() 
{
    printf '%b\n' "$1" >&2
}

success() 
{
    if [ "$ret" -eq '0' ]; then
        msg "${1}${2}"
    fi
}

error() 
{
    msg "${1}${2}"
    exit 1
}

program_exists() 
{
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
        error "$2"
    fi
}

link()
{
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

clone_config()
{
    if [! -d "$HOME/.vim-tt" ]; then
        mkdir $HOME/.vim-tt
    fi

    git clone $CONFIG_URI "$config_dir"
    success "$1"
}

install_vundle() 
{
    if [! -d "$HOME/.vim/bundle/vundle" ]; then
        mkdir -p $HOME/.vim/bundle/vundle
    fi

    git clone $VUNDLE_URI "$HOME/.vim/bundle/vundle"
    vim +BundleInstall! +BundleClean +qall

    success"$1"
}

program_exists "vim" "vim installation is required to continue the installation."
program_exists "git" "git installation is required to continue the installation."

clone_config "vim configuration files are cloned successfully."

link "$config_dir/.vimrc"           "$HOME/.vimrc"
link "$config_dir/.vimrc.bundles"   "$HOME/.vimrc.bundles"

install_vundle "Successfully installed vundle and the bundles"

msg            "Installation is now complete."
