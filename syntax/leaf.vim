" Vim syntax file
" Language:	Leaf
" Maintainer:	Ivo wetzel
" Last Change:	2011 Sep 22

" tuning parameters:
" unlet leaf_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'leaf'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("leaf_fold")
  unlet leaf_fold
endif


syn keyword leafCommentTodo         TODO FIXME XXX TBD contained
"syn match   leafLineComment         "\/\/.*" contains=
syn match   leafComment	            "#.*$" contains=@Spell,leafCommentTodo

"syn match   leafCommentSkip         "^[ \t]*\*\($\|[ \t]\+\)"
syn region  leafBlockComment	    start="###"  end="###" contains=@Spell,leafCommentTodo
syn match   leafSpecial	            "\\\d\d\d\|\\."
syn region  leafStringD	            start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=leafSpecial,@htmlPreproc
syn region  leafStringS	            start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=leafSpecial,@htmlPreproc

syn match   leafSpecialCharacter    "'\\.'"
syn match   leafNumber	            "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  leafRegexpString         start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword leafMember		    location prototype constructor toString call apply hasOwnProperty setTimeout clearTimeout setInterval clearInterval isNaN construct destruct

syn match   leafThis                /@\%(\I\i*\)\?/
syn keyword leafFlow                if else elif switch case default while for do in break continue return try catch finally raise
syn keyword leafOperator	    new del is 
syn keyword leafType		    Int Float String Bool Array Hash Function Null Mixed
syn keyword leafBoolNull	    true false

syn keyword leafReserved	    class extends implements interface namespace import export using
syn keyword leafModifier	    const static abstract
syn keyword leafClass               construct destruct private protected public 


if exists("leaf_fold")
    syn match	leafFunction	    "\<function\>"
    syn region	leafFunctionFold    start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match leafSync	    grouphere leafFunctionFold "\<function\>"
    syn sync match leafSync	    grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword leafFunction	   function
    syn match	leafBraces	   "[{}\[\]]"
    syn match	leafParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "leaf"
  syn sync ccomment leafComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_leaf_syn_inits")
  if version < 508
    let did_leaf_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink leaf         		    Normal

  HiLink leafComment		    Comment
  HiLink leafBlockComment	    Comment
  HiLink leafCommentTodo	    Todo

  HiLink leafThis		    Identifier
  HiLink leafFlow                   Conditional
  HiLink leafError		    Error
  HiLink leafOperator	            Operator
  HiLink leafType		    Type
  HiLink leafBoolNull	            Number
  HiLink leafReserved	            Keyword
  HiLink leafModifier	            Keyword
  HiLink leafAccess	            Conditional
  HiLink leafClass                  Member
  HiLink leafDebug		    Debug

  HiLink leafNumber		    Number
  HiLink leafStringS		    String
  HiLink leafStringD		    String
  HiLink leafRegexpString	    String

  HiLink leafBraces		    Function
  HiLink leafParenError		    Error 

  HiLink leafMember		    Member 
  HiLink leafSpecial		    Special
  HiLink leafSpecialCharacter	    Special

  HiLink leafFunction		    Function
  HiLink leafNull		    Number  
  HiLink leafBoolean		    Boolean  

  delcommand HiLink
endif

let b:current_syntax = "leaf"
if main_syntax == 'leaf'
  unlet main_syntax
endif

" vim: ts=8
