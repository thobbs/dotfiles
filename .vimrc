set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" plugins on GitHub repo
Plugin 'tpope/vim-fugitive' " git commands
" Plugin 'tpope/vim-fireplace' " clj repl interaction
" Plugin 'guns/vim-slamhound' " clj namespace management
Plugin 'vim-syntastic/syntastic' " clj linter
Plugin 'aclaimant/syntastic-joker' " clj linter
Plugin 'vim-airline/vim-airline' " better statusline
Plugin 'vim-airline/vim-airline-themes' " fit airline to theme
Plugin 'morhetz/gruvbox' " color scheme
Plugin 'kien/rainbow_parentheses.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
" filetype plugin indent on
set background=dark

set tabstop=4
set shiftwidth=4
set expandtab

set mouse=r

set incsearch
set hlsearch

set wildignore=*.pyc

set foldmethod=syntax

" Visually indicate trailing whitespace
set list listchars=tab:\ \ ,trail:·

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
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd BufWritePost *.clj call SyntasticCheck()
