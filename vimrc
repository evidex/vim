set runtimepath+=~/.vim

source ~/.vim/vimrcs/plugins.vim
source ~/.vim/vimrcs/config.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/typos.vim
if !empty(glob("~/.vim/vimrcs/credentials.vim"))
    source ~/.vim/vimrcs/credentials.vim
endif
if !empty(glob("~/.dotfiles/config/vimrc.vim"))
    source ~/.dotfiles/config/vimrc.vim
endif
