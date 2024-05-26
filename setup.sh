#!/bin/bash

# create the conda environment
if conda env list | grep -q devtools; then
    echo "A conda environment named devtools already exists"
else
	mamba env create -f environment.yaml
fi

# create link to config directory expected by nvim
if [ -d ~/.config/nvim ] || [ -L ~/.config/nvim ]; then
	read -p "The folder ~/.config/nvim already exists. Do you want to delete it? (y/N): " user_response
	if [ "$user_response" = "y" ] || [ "$user_response" = "Y" ]; then
	    rm -rf ~/.config/nvim
	    if [ $? -ne 0 ]; then
		echo "Failed to delete the folder."
		exit 1
	    fi
	else
		echo "Not deleted"
		exit 1
	fi
fi
ln -s ~/repositories/devtools/nvim ~/.config/nvim

# clone package manager
git clone https://github.com/VundleVim/Vundle.vim.git ./nvim/bundle/Vundle.vim
# install plugins
nvim +PluginInstall +qall

# add alias to .bashrc
if grep -Fxq "alias n='nvim'" ~/.bashrc; then
    echo "Line already exists in the file."
else
    echo "alias n='nvim'" >> ~/.bashrc
fi
