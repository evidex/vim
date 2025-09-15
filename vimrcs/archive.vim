"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration snippets which were previously in use
" Retainined in-case they become useful again
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree when in a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
" Fix ^G in output on macOS
let g:NERDTreeNodeDelimiter = "\u00a0"
" Open in a new tab by default
let g:NERDTreeCustomOpenArgs={'file':{'reuse': 'all', 'where': 't', 'keepopen': 1}}
let g:NERDTreeQuitOnOpen=0
" Open the existing NERDTree on each new tab.
"autocmd BufEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips - code completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-d"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GoYo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=74
nnoremap <silent> <leader>z :Goyo<cr>
nnoremap <silent> <F12> :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => hound - search code using etsy/hound
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hound_base_url = 'http://localhost'
let g:hound_ignore_case = 1
let g:hound_vertical_split = 1
" Search hound for the word under the cursor
map <leader>l; :Hound <C-r><C-w><cr>
" Generic search
map <leader>ll :Hound<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


" Force redraws - https://github.com/vim-syntastic/syntastic/issues/822
" set ttyfast
" au FileWritePost * :redraw!
" au TermResponse * :redraw!
" au TextChanged * :redraw!
" au QuickFixCmdPre * :redraw!
" au QuickFixCmdPost * :redraw!
