" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle "wincent/Command-T.git"
Bundle "msanders/snipmate.vim"
"Bundle "surround.vim"
Bundle "plasticboy/vim-markdown"

filetype on

" Basics
set t_Co=256
colorscheme symfony
set guifont=Monospace\ 8
set number
syntax enable

" Plugin configs
let g:superTabDefaultCompletionType = "context"
let g:syntastic_stl_format = '[%E{Err: %e #%fe}%B{, }%W{Warn: %w #%fw}]'
let g:syntastic_auto_loc_list = 2 "auto close
let g:syntastic_cpp_check_header = 1
let NERDTreeIgnore = ['\.pyc$', '\.h\.gch$', '\.o$']
let NERDTreeShowBookmarks=1

let g:SuperTabMappingBackward = '<S-tab>'
let g:fuf_buffer_keyDelete = '<C-d>'
let g:gundo_right = 1
let g:CommandTMaxHeight = 20


" Filetype stuff
filetype plugin on
set ofu=syntaxcomplete#Complete
set ofu=javascript#Complete

" Smart tabbing / autoindenting
set undolevels=500
set autoindent
set backspace=2

" No error bells
set noerrorbells
set visualbell
set t_vb=

" Show tab and eol chars
set listchars=tab:▸\ ,eol:¬

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
set mouse=n
set cc=80

" Jump over everything with backspace
set backspace=eol,start,indent

" Search and Highlighting
set wrapscan
set magic
set showmatch
set hlsearch
set incsearch
set ignorecase 
set smartcase
set enc=utf-8
set nofoldenable

" General Options

" fast terminal
set ttyfast 

set nostartofline
set virtualedit=all
set hidden

" Don't redraw while in macros
set lazyredraw

" Statusline setup
set laststatus=2

" Keep 4 lines top/bottom when scrolling
set scrolloff=4
set wildmenu
set wildignore+=*.o,*.obj,.git,.hg
set fillchars=""
set clipboard=unnamedplus
let g:clipbrdDefaultReg = '+'
set shortmess+=I
set spellfile=~/.vim/dict.add

" No backups
set nobackup
set nowb
set noswapfile

" Quick Mappings
nnoremap <silent> <F4> :nohl<CR>
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :so ~/.vimrc<CR>

" Print out highlight group for colorscheme editing
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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
nmap <silent> <C-t> :CommandT<CR>
nnoremap <silent> <S-t> :FufBuffer<CR>
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
nmap ö ysw

" Quicker selects
nmap Ü viB
nmap Ä vi]

" Remap umlauts for fast insertion 
imap ö [
imap ä {
inoremap Ö -><ESC>a

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz
map * *N

" Highlight the cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline

" Get rid of the window command prefix
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

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

" Leader key stuff
let mapleader = ","

" ,f ,w etc
let g:EasyMotion_leader_key = '<Leader>'

nmap <silent> <Leader>gd :Gdiff<CR>
nmap <silent> <Leader>gc :Gcommit<CR>
nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>gb :Gblame<CR>
nmap <silent> <Leader>bd :bd!<CR>

map q <Nop>
nmap <silent> <Leader>q <C-w>c<CR>

function! s:onStart()
    :NERDTree
    wincmd p
    wincmd v
endfunction

function! g:Setup()
    autocmd VimEnter * call s:onStart()
endfunction

