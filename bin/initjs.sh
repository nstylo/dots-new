#!/bin/bash

ask() {
    read -p "Do you want to initialize a js environment (y/n)? " choice
    case "$choice" in
        y|Y ) ;;
        n|N ) exit;;
        * ) echo "invalid answer" && ask;;
    esac
}

# ask user for input
ask

# install yarn
yarn install
# Install ESLInt with NPM
yarn add eslint --save-dev
# Create an initial configuration file.
./node_modules/.bin/eslint --init
