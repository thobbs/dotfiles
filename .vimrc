set nocompatible

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

" Visually indicate trailing whitespace
set list listchars=tab:\ \ ,trail:·

colorscheme 256-grayvim

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
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E501,E302,E261,W801"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

let g:Powerline_symbols = 'fancy'

" custom color schemes for statusline
hi User1 ctermbg=black ctermfg=114   guibg=black guifg=blue
hi User2 ctermbg=black ctermfg=blue  guibg=black guifg=blue
hi User3 ctermbg=black ctermfg=red   guibg=black  guifg=red

set laststatus=2
set statusline=
set statusline+=[%1*%n%*]\               " buffer number
set statusline+=%2*%<%.99f\              " path, filename
set statusline+=%3*%h%w%m%r%*\           " flags
set statusline+=%{fugitive#statusline()} " git status
set statusline+=%=                       " right align
set statusline+=%-10(\ %l,%c\ %)%P       " position
