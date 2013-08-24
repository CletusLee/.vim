.vim
====

This repo is for storing my personal vim settings. The purpose of all the plugins is to build an IDE for developing python programs.


Make sure you have already installed pip.

1. sudo apt-get install python-pip


Execute following instructions to install plugins.

1. git clone --recursive https://github.com/CletusLee/.vim.git ~/.vim
2. ln -s ~/.vim/vimrc ~/.vimrc
3. sudo pip install jedi
4. sudo apt-get install exuberant-ctags
5. sudo pip install -U pytest
6. sudo pip install dbgp vim-debug
7. install-vim-debug.py

(Optional. If you do not want to install YouCompleteMe plugin, following steps
will lead you to go back to the old version.)

8. git reset --hard v7.3 
(You might see an error message says some folders cannot be removed)
9. git clean -fd
10. cd ~/.vim/bundle
11. git clean -f -f -d YouCompleteMe


Installation of YouCompleteMe
-----------------------------

If you are not satisfied with the auto-complete feature that jedi provides,
follow these tips to install plugin [YouCompleteMe](https://github.com/Valloric/YouCompleteMe).

Prepare tools for adding a new apt repo

1. sudo apt-get install software-properties-common
2. sudo apt-get install python-software-properties

Add a new apt repo and upgrade vim to the latest version(should be above 7.4)

3. sudo add-apt-repository ppa:fcwu-tw/ppa
4. sudo apt-get update
5. sudo apt-get install vim

Install the compiler 

6. sudo apt-get install build-essential cmake python-dev

compile YCM

7. cd ~/.vim/bundle/YouCompleteMe
8. ./install.sh --clang-completer



