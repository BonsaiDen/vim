" Vim color file
" Maintainer: Juan frias <juandfrias at gmail dot com>
" Last Change: 2009 Apr 4
" Version: 1.0.0
" URL: http://juan.axisym3.net/vim-color-schemes/#symfony

highlight clear
if exists("syntax_on")
 syntax reset
endif

let g:colors_name = "symfony"
set background=dark

highlight Normal ctermfg=15 ctermbg=233 guifg=#ffffff guibg=#222222 gui=NONE

" Search
highlight IncSearch ctermfg=0 ctermbg=202 guifg=#000000 guibg=#ffff00
highlight Search ctermfg=16 ctermbg=202 guifg=#000000 guibg=#c0c000

" Messages
highlight ErrorMsg ctermfg=15 ctermbg=196 guifg=White guibg=Red
highlight WarningMsg ctermfg=196 guifg=Red
highlight ModeMsg cterm=bold gui=bold
highlight MoreMsg cterm=bold ctermfg=72 gui=bold guifg=SeaGreen
highlight Question cterm=bold ctermfg=46 gui=bold guifg=Green

" Split area area
highlight StatusLine cterm=bold,reverse gui=bold,reverse
highlight StatusError cterm=bold,reverse ctermfg=Red gui=bold,reverse
highlight StatusLineNC cterm=reverse gui=reverse
highlight VertSplit ctermfg=255 ctermbg=255  gui=reverse
highlight WildMenu ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow

" Diff
highlight DiffAdd ctermfg=254 ctermbg=71 guifg=#E6E1DC guibg=#519F50
highlight DiffDelete ctermfg=236 ctermbg=234 guifg=#303030 guibg=#1c1c1c
highlight DiffChange ctermbg=52 guibg=#600000
highlight DiffText ctermfg=254 ctermbg=124 guifg=#E6E1DC guibg=#b00000

" Cursor
highlight CursorColumn ctermbg=241 guibg=Grey40
highlight CursorLine ctermbg=235 guibg=#000000 cterm=NONE gui=NONE
highlight Cursor ctermfg=0 ctermbg=15 guifg=#000000 guibg=#FFFFFF
highlight lCursor ctermfg=0 ctermbg=235 guifg=bg guibg=fg

" Fold
highlight Folded ctermfg=236 ctermbg=248 guifg=#333333 guibg=DarkGrey
highlight FoldColumn ctermfg=236 ctermbg=250 guifg=#333333 guibg=Grey

" Popup Menu Menu
highlight Pmenu ctermbg=25  guibg=Magenta
highlight PmenuSel ctermbg=19  guibg=DarkGrey
highlight PmenuSbar ctermbg=250 guibg=Grey
highlight PmenuThumb cterm=reverse gui=reverse

" Syntax group
highlight Comment ctermfg=244 guifg=#bd48b3 gui=NONE
highlight Member ctermfg=248 guifg=#b2b2b2 gui=NONE
highlight Constant ctermfg=67 guifg=#6D9CBE gui=NONE
highlight Error ctermfg=215 ctermbg=88 guifg=#FFC66D guibg=#990000 gui=NONE
highlight Identifier ctermfg=67 guifg=#6D9CBE gui=NONE
highlight Ignore ctermbg=233 guifg=bg
highlight PreProc ctermfg=254 guifg=#E6E1DC
highlight Special ctermfg=221 guifg=#ffcc66 gui=NONE
highlight Statement ctermfg=208 ctermbg=233 guifg=#ff8400 guibg=bg
highlight Todo ctermfg=226 guifg=#ffff00 ctermbg=233 cterm=bold
highlight Type ctermfg=167 guifg=#da4939 gui=NONE
highlight Underlined cterm=underline ctermfg=111 gui=underline guifg=#80a0ff
highlight String ctermfg=118 guifg=#99ff00 gui=NONE
highlight Number ctermfg=197 guifg=#A5C261 gui=NONE
highlight Define ctermfg=221 guifg=#ffcc66 gui=NONE
highlight Function ctermfg=221 guifg=#ffcc66 gui=NONE
highlight Include ctermfg=173 guifg=#CC7833 gui=NONE
highlight Keyword ctermfg=221 guifg=#ffcc66 gui=NONE
highlight Operator ctermfg=208 guifg=#f0f0f0 gui=NONE
highlight PreCondit ctermfg=173 guifg=#CC7833 gui=NONE
highlight StorageClass ctermfg=221 guifg=#ffcc66 gui=NONE

"Spelling
highlight SpellBad cterm=undercurl ctermfg=160 gui=undercurl guifg=#D70000
highlight SpellCap cterm=underline ctermfg=189 gui=underline guifg=#D0D0FF
highlight SpellLocal cterm=undercurl gui=undercurl
highlight SpellRare cterm=underline ctermfg=168 gui=underline guifg=#D75F87

" Other
highlight Directory ctermfg=51 guifg=Cyan
highlight LineNr ctermfg=16  ctermbg=238 guifg=#2B2B2B guibg=#C0C0FF
highlight ColorColumn ctermbg=234 guibg=#C0C0FF
highlight NonText ctermfg=235 ctermbg=233 guifg=#505050 guibg=#222222
highlight SpecialKey ctermfg=235 guifg=lightslategrey
highlight Title cterm=bold ctermfg=15 gui=bold guifg=#FFFFFF
highlight Visual ctermbg=239 guibg=#5A647E gui=NONE
highlight MatchParen ctermfg=15 ctermbg=23 guifg=#FFFFFF guibg=#005f5f
highlight SignColumn ctermfg=16 ctermbg=238 guifg=Cyan guibg=Grey
highlight Structure ctermfg=221 guifg=#ffcc66
highlight TabLineFill cterm=reverse gui=reverse
highlight TabLine cterm=underline ctermbg=248 gui=underline guibg=DarkGrey
highlight TabLineSel cterm=bold gui=bold
highlight VisualNOS cterm=bold,underline gui=bold,underline

" Links
highlight link Macro PreProc
highlight link Exception Statement
highlight link Conditional Statement
highlight link Repeat Statement
highlight link Label Statement
highlight link Boolean Constant
highlight link Float Number
highlight link Character Constant
highlight link Typedef Type
highlight link Tag Special
highlight link SpecialChar Special
highlight link Delimiter Special
highlight link SpecialComment Special
highlight link Debug Special

" vim:ff=unix:
