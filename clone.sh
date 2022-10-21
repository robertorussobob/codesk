#!/bin/bash

NC='\033[0m' # No Color
BLUE='\033[1;34m'
COLOR=$BLUE
log() {
	printf "${COLOR}$1${NC}\n";
}

clone() {
	REPO="$3"
    DIR="$2"
	LINK_NAME="$1"
    log "> $LINK_NAME"
    log "clone into [$LINK_NAME] repo [$DIR] ($REPO)"
	rm -rf $DIR
	rm -rf $LINK_NAME
	git clone $REPO
	ln -s -d $DIR $LINK_NAME
}

CODECOMMIT_PREFIX="https://git-codecommit.eu-central-1.amazonaws.com/v1/repos"

clonecc() {
	DIR="$2"
	LINK_NAME="$3"
    log "> $LINK_NAME"
    log "About to clone into [$LINK_NAME] repo [$DIR]"
	rm -rf $DIR
	rm -rf $LINK_NAME
	git clone $1/$DIR
	ln -s -d $DIR $LINK_NAME
}

clone_codecommit() {
	clonecc $CODECOMMIT_PREFIX $1 $2
}

