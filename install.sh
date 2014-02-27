#!/usr/bin/env bash

[ -z "$VUNDLE_URL" ] && VUNDLE_URL="https://github.com/gmarik/vundle.git"

msg() {
    printf '%b\n' "$1" >&2
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

program_exists() {
    local exists='0'
    type $1 >/dev/null 2>&1 || {local exists='1';}

    if [ ! "$exists" -eq '0' ]; then
        error "$2"
    fi
}

install_vundle() {
    if [! -d "$HOME/.vim/bundle/vundle"]; then
        mkdir -p $HOME/.vim/bundle/vundle
    fi

    git clone $VUNDLE_URL "$HOME/.vim/bundle/vundle"
    vim +BundleInstall! +BundleClean +qall

    success"$1"
}

program_exists "vim" "vim installation is required to continue the installation."
program_exists "git" "git installation is required to continue the installation."

install_vundle "Successfully installed the bundles"
