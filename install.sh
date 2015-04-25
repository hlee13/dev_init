#!/bin/sh

echo "replace ~/.gitconfig with src/gitconfig"
cp src/gitconfig ~/.gitconfig
cp src/git-completion.bash ~/.git-completion.bash

echo "replace ~/.vimrc with src/vimrc"
cp src/vimrc ~/.vimrc

echo "Install ycm_extra_conf.py for project"
cp ./src/ycm_extra_conf.py ~/.ycm_extra_conf.py

echo "Install shell Tool"
mkdir -p ~/.scripts
cp ./scripts/* ~/.scripts/
cp ./templete/ ~/.vim/ -r

echo "Install plugin"
mkdir -p ~/.vim/plugin
cp ./src/*.vim ~/.vim/plugin/

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

grep PATH ~/.bashrc | grep \.scripts > /dev/null
if [ $? -ne 0 ]; then
    # not found
    echo "PATH=\$PATH:~/.scripts/" >> ~/.bashrc
    source ~/.bashrc
fi

vim -c BundleInstall
echo "BundleInstall Done!"

uname -i | grep "64" > /dev/null
if [ $? -eq 0 ]; then
    echo "cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"
    cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
else
    echo "cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang --system-boost"
    cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang --system-boost 
fi
