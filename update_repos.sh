#!/bin/bash

MAGIT_REPO='http://github.com/magit/magit.git'
MAGIT_DIRECTORY='magit'
SLIME_REPO='https://github.com/archimag/slime-archimag.git'
SLIME_DIRECTORY='slime'
AUTOCOMPLETE_DIR='auto-complete'
AUTOCOMPLETE_REPO='git://github.com/auto-complete/auto-complete.git'
CEDET_REPOSITORY='bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk'
CEDET_DIRECTORY='cedet'
YASNIPPET_REPOSITORY='https://github.com/capitaomorte/yasnippet.git'
YASNIPPET_DIRECTORY='yasnippet'
GIT_PULL_COMMAND='git pull'
GIT_CLONE_COMMAND='git clone'
BZR_CHECKOUT_COMMAND='bzr checkout'
BZR_UPDATE_COMMAND='bzr update'
MARKDOWN_DIR="markdown-mode"
MARKDOWN_REPO="git://jblevins.org/git/markdown-mode.git"
YAML_REPO="git://github.com/yoshiki/yaml-mode.git"
YAML_DIR="yaml-mode"
POPUP_REPO='git://github.com/auto-complete/popup-el.git'
POPUP_DIR="popup-el"
HASKELL_REPO='git://github.com/haskell/haskell-mode.git'

check_slime() {
    if [[ -d $SLIME_DIRECTORY ]];then
        update_slime
    else
        install_slime
    fi
}

update_slime() {
    pushd $SLIME_DIRECTORY
    git_reset "$SLIME_REPO"
    popd
}

install_slime() {
    $GIT_CLONE_COMMAND $SLIME_REPO
    mv slime-archimag $SLIME_DIRECTORY
}

check_cedet() {
    if [[ -d $CEDET_DIRECTORY ]];then
        update_cedet
    else
        install_cedet
    fi
}

update_cedet() {
    pushd $CEDET_DIRECTORY
    $BZR_UPDATE_COMMAND
    make all
    popd
}

install_cedet() {
    $BZR_CHECKOUT_COMMAND $CEDET_REPOSITORY $CEDET_DIRECTORY
    pushd $CEDET_DIRECTORY
    make all
    popd
}

check_haskell() {
    if [[ -d haskell-mode ]];then
    	pushd haskell-mode
        git_reset "$HASKELL_REPO"
	    make all
	    popd
    else
    	git clone "$HASKELL_REPO"
	    pushd haskell-mode
	    make all
	    popd
    fi
}

git_reset () {
    repo=$1
    git config remote.origin.url $repo # works even when repo url was changed
    git fetch origin
    git checkout -f master
    git reset origin/master
    git checkout -f master
    git clean -df
}
    

check_git () {
    dir=$1
    repo=$2
    if [[ -d $dir ]];then
        pushd $dir
        git_reset $repo
        popd
    else
        $GIT_CLONE_COMMAND $repo
    fi
}

check_slime
check_git "$MAGIT_DIRECTORY" "$MAGIT_REPO"
check_git "$AUTOCOMPLETE_DIR" "$AUTOCOMPLETE_REPO"
check_cedet
check_git "$YASNIPPET_DIRECTORY" "$YASNIPPET_REPOSITORY"
check_haskell
check_git "$POPUP_DIR" "$POPUP_REPO"
check_git "$MARKDOWN_DIR" "$MARKDOWN_REPO"
check_git "$YAML_DIR" "$YAML_REPO"
