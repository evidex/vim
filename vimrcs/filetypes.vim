""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let g:python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

au BufNewFile,BufRead *.mako set ft=mako

" au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>c /class <cr>
au FileType python map <buffer> <leader>d /def <cr>
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def 
au FileType python autocmd BufWrite <buffer> :call DeleteTrailingWS()
" Highlight lines that go over 140 chars
augroup python_overlength
    autocmd BufEnter *.py highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    autocmd BufEnter *.py match OverLength /\%141v.\+/
augroup END
" Use flake8 for verification
"let g:syntastic_python_checkers=['flake8', 'pycodestyle', 'pyflakes']
"au Filetype python let g:syntastic_python_flake8_args='--color never --ignore=H306,H304 --max-complexity=20 --show-source'
"au Filetype python let g:syntastic_python_flake8_args.=' --max-line-length=150 --enable-extensions=H904' " leading space is important
"
"au FileType python let g:syntastic_python_pycodestyle_args='--ignore=E701,E266,E261,E225,E226,E301 --max-line-length=150'

" ALE syntax checking 
" Common options for flake8, pycodestyle, and pylint
let py_lint_common="--max-line-length=150"
au Filetype python let g:ale_python_flake8_options=py_lint_common
au FileType python let g:ale_python_pycodestyle_options=py_lint_common
au FileType python let g:ale_python_pylint_options=py_lint_common

" Specific options for each linter - note the .= concat and leading space!
au Filetype python let g:ale_python_flake8_options.=' --color never --ignore H306,H304, --max-complexity=20 --enable-extensions=H904' " leading space is important
au FileType python let g:ale_python_pycodestyle_options.=' --ignore=E701,E266,E261,E225,E226,E301'
au FileType python let g:ale_python_pylint_options.=' --disable=E0401,R0902,W0718,no-member,R0903,C0115,C0116,R0913 --variable-naming-style=any --argument-naming-style=any --max-branches=20'
au FileType python let g:ale_python_pylint_options.=' --disable=E0401,E0402,E0611,E0633,E0705,E0712,E1101,E1121,E1123,E1133,E1134,E1135,E1136'
""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => Puppet Section
""""""""""""""""""""""""""""""
let g:ale_puppet_puppetlint_options = '--no-80chars-check --no-140chars-check --no-autoloader_layout-check'
au FileType puppet autocmd BufWrite <buffer> :call DeleteTrailingWS()
" Replaces ruby hash in the format
"   key: val
" with the format
"   key => val
" Particularly useful for translating rspec test resources into puppet code
vnoremap <leader>0 :s!\(\w\+\):\(\s*\)\(\w\\|'\\|"\\|\[\\|\$\\|{\)\(.*\)!\1\2=> \3\4!g<cr>

""""""""""""""""""""""""""""""
" => Ruby Section
""""""""""""""""""""""""""""""
au FileType ruby set tabstop=2 shiftwidth=2
au FileType ruby autocmd BufWrite <buffer> :call DeleteTrailingWS()
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_ruby_rubocop_args='--no-color'

""""""""""""""""""""""""""""""
" => Vagrantfile Section
""""""""""""""""""""""""""""""
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

""""""""""""""""""""""""""""""
" => BASH Section
""""""""""""""""""""""""""""""
" Use BASH highlighting as the sh default
let g:is_bash=1

""""""""""""""""""""""""""""""
" => Markdown 
""""""""""""""""""""""""""""""
" Change colorscheme for markdown files
au FileType markdown colorscheme landscape
au FileType markdown set spell
au FileType markdown set nofoldenable

""""""""""""""""""""""""""""""
" => YAML 
""""""""""""""""""""""""""""""
au FileType yaml set tabstop=2 shiftwidth=2 expandtab
au FileType yaml autocmd BufWrite <buffer> :call DeleteTrailingWS()
let g:syntastic_yaml_checkers=['yamllint']
let g:syntastic_yaml_yamllint_args='-d "{extends: default, rules: {line-length: disable}}"'

""""""""""""""""""""""""""""""
" => JSON 
""""""""""""""""""""""""""""""
au FileType json set tabstop=2 shiftwidth=2 expandtab 
" Open 5 folds by default
au FileType json set foldlevel=5 foldmethod=syntax

""""""""""""""""""""""""""""""
" => gitcommit
""""""""""""""""""""""""""""""
au FileType gitcommit setlocal spell! 

""""""""""""""""""""""""""""""
" => Groovy section
"""""""""""""""""""""""""""""""
au FileType groovy setl nosmartindent copyindent preserveindent
"
""""""""""""""""""""""""""""""
" => terraform 
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.tf set filetype=terraform syntax=terraform
au FileType terraform set tabstop=2 shiftwidth=2 expandtab
let g:syntastic_cloudformation_checkers = ['terraform validate']
au FileType terraform autocmd BufWrite <buffer> :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => Toml
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.toml set syntax=toml filetype=toml
au FileType toml set tabstop=2 shiftwidth=2 expandtab
 
""""""""""""""""""""""""""""""
" => Cloudformation
"""""""""""""""""""""""""""""""
let g:syntastic_cloudformation_checkers = ['cfn_lint']

""""""""""""""""""""""""""""""
" => Makefile
"""""""""""""""""""""""""""""""
autocmd FileType make setlocal noexpandtab
