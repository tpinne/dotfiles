#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	stow --ignore ".git/" \
		--ignore "bin" \
		--ignore "init" \
		--ignore "oh-my-zsh" \
		--ignore ".DS_Store" \
		--ignore ".osx" \
		--ignore ".macos" \
		--ignore "bootstrap.sh" \
		--ignore "README.md" \
		--ignore "LICENSE-MIT.txt" \
		.;
	#source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
