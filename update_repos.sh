#!/bin/bash

MAGIT_REPO='http://github.com/magit/magit.git'
MAGIT_DIRECTORY='magit'
SLIME_REPO='http://github.com/nablaone/slime.git'
SLIME_DIRECTORY='slime'
GIT_PULL_COMMAND='git pull'
GIT_CLONE_COMMAND='git clone'



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
    if [[ -d SLIME_DIRECTORY ]];then
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
}


check_slime
check_magit