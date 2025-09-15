#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ln -s $DIR/vimrc $HOME/.vimrc

echo "Installing vim-plug"
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
vim +PluginInstall +qall

echo "Install checkers required by syntastic"
echo "Please install jsonlint with 'brew' or 'npm'"
echo "Please install rubocop with 'gem'"
echo "Please install pyflakes isort flake8 via 'pip'"
