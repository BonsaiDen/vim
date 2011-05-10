" Basics
set t_Co=256
colorscheme symfony
set guifont=Monospace\ 8
set number

let g:superTabDefaultCompletionType = "context"

" Filetype stuff
filetype on
filetype plugin on
set ofu=syntaxcomplete#Complete
set ofu=javascript#Complete

"
" Smart tabbing / autoindenting
set undolevels=150
set nocompatible
set autoindent
set smarttab
set backspace=2
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap
set equalalways
set mouse=a
set backspace=eol,start,indent

" Search and Highlighting
set wrapscan
set showmatch
set hlsearch
set incsearch
set ignorecase smartcase
set enc=utf-8
set nofoldenable

" General Options
set ch=2
set cpoptions+=$
set virtualedit=all
set laststatus=2
set hidden
set nolazyredraw
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set scrolloff=4
set wildmenu
set fillchars=""
set clipboard=unnamed
set shortmess+=I
set spellfile=~/.vim/dict.add

" No backups
set nobackup
set nowb
set noswapfile

" Text options
"set textwidth=80

" Mappings
nnoremap <silent> <F5> :TlistToggle<CR>
nnoremap <silent> <F4> :nohl<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :so ~/.vimrc<CR>
inoremap ß {<CR>}<ESC>ko<Tab>
noremap! <silent> § <ESC>
vnoremap <silent> § <ESC>
snoremap <silent> § <ESC>
nnoremap <silent> <c-o> o<ESC>k
nnoremap <silent> ü '.

nnoremap <silent> <C-t> :CommandT<CR>
nnoremap <silent> <S-k> 3k
vnoremap <silent> <S-k> 3k
nnoremap <silent> <S-j> 3j
vnoremap <silent> <S-j> 3j

" I always manage to hit 
nnoremap <silent> + <nop>
command! W w
command! E e

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline

function! Komment()
  if getline(".") =~ '^\/\/'
    let hls=@/
    s/^\/\///e
    let @/=hls
  else
    let hls=@/
    s/^/\/\//e
    let @/=hls
  endif
endfunction

map <silent> m :call Komment()<CR>

"nnoremap <silent> <C-n> 0gt
"nnoremap <silent> <C-b> 0gT

"nnoremap <C-e> :e<space>
"nnoremap <C-w> :w<space>


" MiniBuf
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

" Strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Move lines
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

"nnoremap <silent> ä :call <SID>swap_up()<CR>
"nnoremap <silent> ö :call <SID>swap_down()<CR>

nmap ä cs
nmap ö ysw
inoremap ö []<ESC>i
inoremap ä {}<ESC>i
inoremap Ö -><ESC>a

" Truncate Lines on write
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

" Execute via Shebang
map <C-X> :call CallInterpreter()<CR>

au BufEnter *
\ if match (getline(1) , '^\#!') == 0 |
\   execute("let b:interpreter = getline(1)[2:]") |
\ endif

au BufWritePre *
\ if match (getline(1) , '^\#!') == 0 |
\   execute("let b:interpreter = getline(1)[2:]") |
\ endif

fun! CallInterpreter()
    if exists("b:interpreter")
        exec("! ".b:interpreter." %")
    endif
endfun

"autocmd BufEnter * cd %:p:h

" Per file type
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal tags=./tags,~/.vim/tags/javascript/tags

