" Basics
set t_Co=256
colorscheme symfony
set guifont=Monospace\ 8
set number

let g:superTabDefaultCompletionType = "context"
let g:syntastic_stl_format = '[%E{Err: %e #%fe}%B{, }%W{Warn: %w #%fw}]'
let g:syntastic_auto_loc_list = 2 "auto close

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
set backspace=2

" smarttabs
set smarttab

" when auto-indenting, indent by this much
set shiftwidth=4

" expand tabs to 4 spaces
set tabstop=4

" turn tabkeypresses into spaces
set expandtab

" treate tabkey as 4 spaces but respect hard hard tabs
set softtabstop=4

set nowrap
set equalalways
set mouse=a

" Jump over everything with backspace
set backspace=eol,start,indent

" Search and Highlighting
set wrapscan
set magic
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
set hidden
set nolazyredraw

" Statusline setup
set laststatus=2
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set statusline+=%=
set statusline+=%#statuserror#
set statusline+=%{SyntasticStatuslineFlag()}

" Keep 4 lines top/bottom when scrolling
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

" Quick Mappings
nnoremap <silent> <F5> :TlistToggle<CR>
nnoremap <silent> <F4> :nohl<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :so ~/.vimrc<CR>

" ESC is aweful to hit, Shift+3 is way more convinient on a GER layout
noremap! <silent> § <ESC>
vnoremap <silent> § <ESC>
snoremap <silent> § <ESC>

" Remap {
"   
" } to .. you see :)
inoremap ß {<CR>}<ESC>ko<Tab>

" Inserting blank lines is useful too
nnoremap <silent> <c-o> o<ESC>k

" Jump to last edited line, useful at times
nnoremap <silent> ü '.

" Command T and syntastic Error list
nnoremap <silent> <C-t> :CommandT<CR>
nnoremap <silent> <C-e> :Errors<CR>

" Speedier movements
nnoremap <silent> <S-k> 3k
vnoremap <silent> <S-k> 3k
nnoremap <silent> <S-j> 3j
vnoremap <silent> <S-j> 3j

" I always manage to hit these at the wrong time so fix it
nnoremap <silent> + <nop>
command! W w
command! E e

" Surround plugin
nmap ä cs
nmap ö ysw

" Remap umlauts for fast insertion 
inoremap ö []<ESC>i
inoremap ä {}<ESC>i
inoremap Ö -><ESC>a

" Highlight the cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline

" stupid commenting... need a plugin for this
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

" MiniBuf
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer
"autocmd BufRead,BufNew,BufDelete :mks ~/.vimsession


" Strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    " active deactive for tab crap
    "%s/\s\s\s\s/\t/ge
    call cursor(l, c)
endfun

autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

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

" Per file type
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal tags=./tags,~/.vim/tags/javascript/tags

