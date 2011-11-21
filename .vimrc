call pathogen#infect()
call pathogen#helptags()

syntax enable
filetype plugin indent on

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=r
set incsearch
set hlsearch
set wildignore=*.pyc
set foldmethod=syntax

colorscheme 256-grayvim

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

let python_highlight_all = 1

" Allow easy navigation to relative files
cmap %/ %:p:h/

" Single key folding
map <buffer> f za
map <buffer> F :call ToggleFold()<CR>
let b:folded = 1

function! ToggleFold()
    if( b:folded == 0 )
        exec "normal! zM"
        let b:folded = 1
    else
        exec "normal! zR"
        let b:folded = 0
    endif
endfunction

" Turn on line numbers:
set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
