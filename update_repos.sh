#!/bin/bash

MAGIT_REPO='http://github.com/magit/magit.git'
MAGIT_DIRECTORY='magit'
SLIME_REPO='https://github.com/archimag/slime-archimag.git'
SLIME_DIRECTORY='slime'
AUTOCOMPLETE_DIR='auto-complete'
AUTOCOMPLETE_REPO='https://github.com/m2ym/auto-complete.git'
CEDET_REPOSITORY='bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk'
CEDET_DIRECTORY='cedet'
YASNIPPET_REPOSITORY='https://github.com/capitaomorte/yasnippet.git'
YASNIPPET_DIRECTORY='yasnippet'
# SOLARIZED_DIRECTORY="emacs-color-theme-solarized"
# SOLARIZED_REPOSITORY="git@github.com:s9gf4ult/emacs-color-theme-solarized.git"
GIT_PULL_COMMAND='git pull'
GIT_CLONE_COMMAND='git clone'
BZR_CHECKOUT_COMMAND='bzr checkout'
BZR_UPDATE_COMMAND='bzr update'


update_magit() {
    pushd $MAGIT_DIRECTORY
    $GIT_PULL_COMMAND origin
    popd
}

install_magit() {
    $GIT_CLONE_COMMAND $MAGIT_REPO
}

check_magit() {
    if [[ -d $MAGIT_DIRECTORY ]];then
        update_magit
    else
        install_magit
    fi
}

check_slime() {
    if [[ -d $SLIME_DIRECTORY ]];then
        update_slime
    else
        install_slime
    fi
}

update_slime() {
    pushd $SLIME_DIRECTORY
    $GIT_PULL_COMMAND origin
    popd
}

install_slime() {
    $GIT_CLONE_COMMAND $SLIME_REPO
    mv slime-archimag slime
}

check_autocomplete() {
    if [[ -d $AUTOCOMPLETE_DIR ]];then
        update_autocomplete
    else
        install_autocomplete
    fi
}

update_autocomplete() {
    pushd $AUTOCOMPLETE_DIR
    $GIT_PULL_COMMAND
    popd
}

install_autocomplete() {
    $GIT_CLONE_COMMAND $AUTOCOMPLETE_REPO
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

check_yasnippet() {
    if [[ -d $YASNIPPET_DIRECTORY ]];then
        update_yasnippet
    else
        install_yasnippet
    fi
}

update_yasnippet() {
    pushd $YASNIPPET_DIRECTORY
    $GIT_PULL_COMMAND
    popd
}

install_yasnippet() {
    $GIT_CLONE_COMMAND $YASNIPPET_REPOSITORY
}

# check_solarized() {
#     if [[ -d $SOLARIZED_DIRECTORY ]];then
#         update_solarized
#     else
#         install_solarized
#     fi
# }

# update_solarized() {
#     pushd $SOLARIZED_DIRECTORY
#     $GIT_PULL_COMMAND origin
#     popd
# }

# install_solarized() {
#     $GIT_CLONE_COMMAND "$SOLARIZED_REPOSITORY"
# }

# update_themes() {
#     pushd color-theme
#     make all
#     popd
#}

check_haskell() {
    if [[ -d haskell-mode ]];then
    	pushd haskell-mode
	git checkout -f master
	git pull origin
	make all
	popd
    else
    	git clone 'git://github.com/haskell/haskell-mode.git'
	pushd haskell-mode
	make all
	popd
    fi
}

check_popup () {
    if [[ -d popup-el ]];then
        pushd popup-el
        git pull origin
        popd
    else
        git clone 'https://github.com/m2ym/popup-el.git'
    fi
}



check_slime
check_magit
check_autocomplete
check_cedet
check_yasnippet
# check_solarized
# update_themes
check_haskell
check_popup
