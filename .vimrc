set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" plugins on GitHub repo
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " clj repl interaction
" Plug 'guns/vim-slamhound' " clj namespace management
Plug 'dense-analysis/ale' " linter
" Plug 'vim-syntastic/syntastic', { 'for': 'clojure' } " linter
" Plug 'aclaimant/syntastic-joker' " clj linter
Plug 'vim-airline/vim-airline' " better statusline
Plug 'vim-airline/vim-airline-themes' " fit airline to theme
Plug 'morhetz/gruvbox' " color scheme
Plug 'luochen1990/rainbow'
" Plug 'ThePrimeagen/vim-be-good'
" Plug 'junegunn/fzf.vim'


" All of your Plugs must be added before the following line
call plug#end()              "required
filetype plugin indent on    " required

syntax enable
" filetype plugin indent on
set background=dark

set tabstop=2
set shiftwidth=2

set expandtab

set mouse=r

set incsearch
set hlsearch

set wildignore=*.pyc

set foldmethod=syntax

" Visually indicate trailing whitespace
set list listchars=tab:\ \ ,trail:·

" Disable syntax highlighting on files over 100kb in size
autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

colorscheme gruvbox

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

autocmd FileType python set foldmethod=indent
let python_highlight_all = 1

" Allow easy navigation to relative files
cmap %/ %:p:h/

" Folding
set foldnestmax=2 "deepest fold is 2 levels
set nofoldenable "dont fold by default

" Single key folding
map <buffer> f za
map <buffer> F :call ToggleFold()<CR>
let b:folded = 0

function! ToggleFold()
    if( b:folded == 0 )
        exec "normal! zM"
        let b:folded = 1
    else
        exec "normal! zR"
        let b:folded = 0
    endif
endfunction

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Automatically run pyflakes after writing a python file
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" syntax checking settings
let g:syntastic_clojure_checkers = ['joker']
let g:syntastic_loc_list_height=3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" rainbow paren settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

au BufEnter,BufReadPost * :RainbowToggleOn
let g:rainbow_conf = {
    \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \    'ctermfgs': ['red', 'darkcyan', 'darkgreen', 'Darkblue', 'darkmagenta', 'brown'],
    \    'operators': '_,_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}

" autocmd BufWritePost *.clj call SyntasticCheck()

"""""""""""""""" JAVASCRIPT """""""""""""""
au FileType javascript set tabstop=2
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set signcolumn=yes

" js linting
let g:ale_linters = { 'javascript': ['prettier', 'eslint'] }
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
