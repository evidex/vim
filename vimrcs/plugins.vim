" vim-plug plugins file
call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug Listing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
Plug 'kien/ctrlp.vim'

" Fugitive
Plug 'tpope/vim-fugitive'

" ALE - Syntastic's spiritual sucessor
Plug 'https://github.com/dense-analysis/ale.git'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'twerth/ir_black'

" Vim-Puppet
Plug 'evidex/vim-puppet'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim Wiki
Plug 'https://github.com/vimwiki/vimwiki.git'

" vim-markdown
Plug 'plasticboy/vim-markdown'

" text alignment
Plug 'godlygeek/tabular'

"SimplyFold FastFold - Python folding tools
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" vim-json
Plug 'https://github.com/elzr/vim-json.git'

" javascript highlighting and folding
Plug 'https://github.com/pangloss/vim-javascript.git'

" vimlint - vim linting plugin
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'

" jedi-vim - Python autocomplete
Plug 'davidhalter/jedi-vim'

" vista.vim - LSP / ctags viewer (tagbar alt)
Plug 'liuchengxu/vista.vim'

" vim-slime - send code to REPLs
Plug 'https://github.com/jpalardy/vim-slime.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Archive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim-Surround - operations around parens & html markers
" Plug 'tpope/vim-surround'

" Nerdtree - directory browser
" Plug 'scrooloose/nerdtree'

" vim-snipmate & Dependencies
" Plug 'https://github.com/SirVer/ultisnips.git'
" Plug 'https://github.com/honza/vim-snippets.git'

" GoYo - distraction free writing
" Plug 'junegunn/goyo.vim'

" Color Scheme Switcher
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'xolox/vim-misc'

" vim-terraform
" Plug 'https://github.com/hashivim/vim-terraform.git'
" vim-terraform-completion
" Plug 'https://github.com/juliosueiras/vim-terraform-completion.git'

" hound search
" Plug 'https://github.com/jfo/hound.vim.git'

" webapi-vim - used by hound
" Plug 'https://github.com/mattn/webapi-vim.git' 

" Syntastic
" Plug 'vim-syntastic/syntastic'

" claude.vim - Claude AI integration
"Plug 'https://github.com/pasky/claude.vim.git'

" github/copilot.vim - CoPilot support
" Plug 'https://github.com/github/copilot.vim'

" vim-pydocstring
"Plug 'https://github.com/heavenshell/vim-pydocstring.git'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Footer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
filetype plugin indent on
