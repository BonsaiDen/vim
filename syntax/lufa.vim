" Vim syntax file
" Language:	lufa
" Maintainer:	Ivo Wetzel
" Last Change:	22.04.2012

" tuning parameters:

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'lufa'
endif

syn keyword lufaCommentTodo         TODO FIXME XXX TBD contained
syn match   lufaComment	            "#.*$" contains=@Spell,lufaCommentTodo

syn region  lufaBlockComment	    start="###"  end="###" contains=@Spell,lufaCommentTodo
syn match   lufaSpecial	            "\\\d\d\d\|\\."
syn region  lufaStringD	            start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=lufaSpecial,@htmlPreproc
syn region  lufaStringS	            start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=lufaSpecial,@htmlPreproc
syn match   lufaSpecialCharacter    "'\\.'"

syn match   lufaNumber	            "\-\=\<0[xX]\x\+\>"
syn match   lufaNumber              "\-\=\<\d\+[eE][+-]\=\d\+\>"
syn match   lufaNumber              "\-\=\<\%([1-9]\d*\|0\)\>"

syn region  lufaRegexpString         start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn match   lufaThis                /@\%(\I\i*\)\?/
syn keyword lufaKeyword             class extends package extern
syn keyword lufaBlock               if elif else try catch finally raise for while scope ret
syn keyword lufaAsciiOperator	    new del is has in
syn keyword lufaType		    void bool int float string list map hash
syn keyword lufaBoolean             true false
syn keyword lufaNull                null

syn keyword lufaModifier	    const static abstract public protected private outer
syn keyword lufaModule              from import as export 

syn match   lufaBraces	            "[{}\[\]]"
syn match   lufaParens	            "[()]"

syn sync fromstart
syn sync maxlines=100

if main_syntax == "lufa"
  syn sync ccomment lufaComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lufa_syn_inits")
  if version < 508
    let did_lufa_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink lufa         		    Normal

  HiLink lufaComment		    Comment
  HiLink lufaBlockComment	    Comment
  HiLink lufaCommentTodo	    Todo

  HiLink lufaThis		    Identifier
  HiLink lufaBlock                  Conditional
  HiLink lufaError		    Error
  HiLink lufaAsciiOperator	    Operator
  HiLink lufaType		    Type
  HiLink lufaKeyword	            Keyword
  HiLink lufaModifier	            Keyword
  HiLink lufaModule                 Member

  HiLink lufaNumber		    Number
  HiLink lufaStringS		    String
  HiLink lufaStringD		    String
  HiLink lufaRegexpString	    String

  HiLink lufaBraces		    Function
  HiLink lufaParenError		    Error 

  HiLink lufaSpecial		    Special
  HiLink lufaSpecialCharacter	    Special

  HiLink lufaNull		    Number  
  HiLink lufaBoolean		    Boolean  

  delcommand HiLink
endif

let b:current_syntax = "lufa"
if main_syntax == 'lufa'
  unlet main_syntax
endif

" vim: ts=8
