"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Customisation Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => VimWiki
""""""""""""""""""""""""""""""
set nocompatible
let g:vimwiki_list = [{'tw': '74', 'formatoptions': 't'}]
let g:vimwiki_dir_link = 'index'
nnoremap <leader>wH :VimwikiAll2HTML<cr>
nnoremap <leader>we :VimwikiTabMakeDiaryNote<cr> 
nnoremap <leader>wi :VimwikiDiaryIndex<cr>:VimwikiDiaryGenerateLinks<cr>
autocmd BufNewFile *.wiki :r! echo = %:t:r =
autocmd BufNewFile *.wiki :norm kddo
let g:vimwiki_key_mappings = { 'table_mappings': 0, }

imap <C-Tab> <Plug>VimwikiTablePreviousCell<cr>
imap <S-Tab> <Plug>VimwikiTableNextCell<cr>


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>;'
let g:ctrlp_cmd = 'CtrlPMixed'
map <leader>' :CtrlPChange<cr>
map <c-b> :CtrlPBuffer<cr>
map <leader>f :CtrlPMRU<cr>

" Make <c-t> (open in tab) default behaviour
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_max_height = 20
"let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|.*\.class'
let g:ctrlp_custom_ignore = '(node_modules|target|dist)|(\.(swp|ico|git|svn))|.*\.(class)'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\/var\/folders.*|\/private\/var\/folders.*$'
  \ }
" When in a VCS directory, use that as the root
let g:ctrlp_working_path_mode = 'ra'
" Retain cache between sessions
let g:ctrlp_clear_cache_on_exit = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="angr"
let g:airline#extensions#virtualenv#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:syntastic_sh_shellcheck_args='-e SC1090'
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_full_redraws = 1
" 
" map <leader>ep :lprevious<cr>
" map <leader>en :lnext<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive (git wrapper)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>3 :Gw<cr>:Gcommit<cr>
:command Gca Git commit --amend %
:command Gpl Git pull --rebase
:command Gst Git status
map <leader>gl :Gllog
hi diffAdded ctermfg=red ctermbg=NONE cterm=bold
hi diffRemoved ctermfg=yellow ctermbg=NONE cterm=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarized Theme 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termtrans = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>= :HeaderIncrease<cr>
map <leader>- :HeaderDecrease<cr>
let g:markdown_folding=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabularize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>6 :Tabularize<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jedi-vim - python code completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_command = "<leader>l"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vista.vim - LSP / ctags viewer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
map <leader>tb :Vista!!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE - syntax checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace']
" \ }
let g:airline#extensions#ale#enabled = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_open_list = 1
let g:ale_close_preview_on_insert = 1
let g:ale_hover_to_preview = 1
let g:ale_locallist_format = 'detail'
" close loclist automatically
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
  augroup END
map <leader>ep :ALEPreviousWrap<cr>
map <leader>en :ALENextWrap<cr>
map <leader>i :ALEFix isort<cr>
map <leader>aff :ALEFixSuggest<cr>
map <leader>af :ALEFix
map <leader><tab> <Plug>(ale_complete)
map <leader>ad <Plug>(ale_detail)<cr>
let g:ale_loclist_msg_format = '%code: %%s'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-slime - sending text to remote shells
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "kitty"
"disables default bindings
let g:slime_no_mappings = 1
"send visual selection
xmap <leader><cr> <Plug>SlimeRegionSend
"send based on motion or text object
nmap <leader><cr> <Plug>SlimeMotionSend
"send line
nmap <leader><cr> <Plug>SlimeLineSend



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ARCHIVED PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => claude.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:claude_use_bedrock = 1
" let g:claude_bedrock_region = 'us-east-1'
" let g:claude_model = 'us.anthropic.claude-sonnet-4-20250514-v1:0'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Github CoPilot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:copilot_workspace_folders = [
"\]
"map <leader>cp :Copilot panel<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pydocstring
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:pydocstring_templates_dir = '~/.vim/templates/pydocstring'
" map <leader><Tab> :Pydocstring<cr>
