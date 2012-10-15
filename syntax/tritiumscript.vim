" Vim syntax file
" Language:	TritiumScript

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'tritiumscript'
endif


" Comments
syn keyword tritiumScriptCommentTodo   TODO FIXME XXX TBD contained
syn match   tritiumScriptLineComment   "#.*" contains=tritiumScriptCommentTodo
syn match   tritiumScriptLineComment	 "//.*"

" Block comments - sync w C style comments to get all that nesting logic
syn region  tritiumScriptBlockComment   start="/\*"  end="\*/"
syn sync ccomment tritiumScriptBlockComment

" Strings - gets quite complicated; copied from JS syntax file
syn match   tritiumScriptSpecial	  "\\\d\d\d\|\\."
syn region  tritiumScriptStringD	  start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  tritiumScriptStringS	  start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  tritiumScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

" Tritium keywords
syn keyword tritiumScriptBase           attribute attributes asset convert_encoding 
syn keyword tritiumScriptBase           else export fetch guess_encoding match match_not
syn keyword tritiumScriptBase           not read regexp rewrite_cookie_domain rewrite_link 
syn keyword tritiumScriptBase           rewrite_to_proxy rewrite_to_upstream sass var with yield

syn keyword tritiumScriptDebug          bm deprecated dump log this time

syn keyword tritiumScriptNode           absolutize add_class cdata copy_here copy_to css dup index 
syn keyword tritiumScriptNode           inject inject_after inject_at inject_before inject_bottom inject_top 
syn keyword tritiumScriptNode           inner inner_text inner_wrap insert insert_after insert_at insert_before insert_bottom
syn keyword tritiumScriptNode           insert_javascript insert_javascript_after insert_javascript_at insert_javascript_before 
syn keyword tritiumScriptNode           insert_javascript_bottom insert_javascript_top insert_top
syn keyword tritiumScriptNode           move move_children_to move_here move_to
syn keyword tritiumScriptNode           name node path position remove remove_text_nodes
syn keyword tritiumScriptNode           select set text wrap wrap_text_children

syn keyword tritiumScriptText           append capture clear concat downcase equal
syn keyword tritiumScriptText           html html_doc html_fragment html_fragment_doc
syn keyword tritiumScriptText           length prepend replace upcase value xml

" Treat $ and $$ selector keywords specially
syn match tritiumScriptInstruction      "\$" 
syn match tritiumScriptInstruction      "\$\$"

" TODO: variables enclosed in brackets should be captured
syn match tritiumScriptVariable         "$\h\w*" display
syn match tritiumScriptVariable         "%\h\w*" display
syn match tritiumScriptInstruction      "@\h\w*" display

syn match tritiumScriptBraces	          "[{}\[\]]"
syn match tritiumScriptParens	          "[()]" 

syn sync fromstart
syn sync maxlines=100

" Color this guy
hi def link tritiumScriptLineComment	      Comment
hi def link tritiumScriptBlockComment	      Comment
hi def link tritiumScriptCommentTodo	      Todo

hi def link tritiumScriptSpecial            Special
hi def link tritiumScriptStringD	          String
hi def link tritiumScriptStringS	          String
hi def link tritiumScriptRegexpString       String

hi def link tritiumScriptDebug              Debug
hi def link tritiumScriptBase               Define

hi def link tritiumScriptNode               Operator
hi def link tritiumScriptText               Operator

hi def link tritiumScriptBraces             Function
hi def link tritiumScriptParens             Function
hi def link tritiumScriptVariable           Type
hi def link tritiumScriptInstruction        Type

" Define Type Include
"
let b:current_syntax = "tritiumscript"
if main_syntax == 'tritiumscript'
  unlet main_syntax
endif

" TODO: include HTML syntax file so that stuff works as well
" TODO: advanced - add some tritium based rules (value worked on inside attribute etc)

" vim: ts=2
