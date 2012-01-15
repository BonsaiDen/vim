if exists("loaded_javascript_syntax_checker")
    finish
endif
let loaded_javascript_syntax_checker = 1

"bail if the user doesnt have jshint installed
if !executable("jshint")
    finish
endif

if !exists("g:syntastic_jshint_reporter")
    let g:syntastic_jshint_reporter = "~/.vim/vim_reporter.js"
endif

if !exists("g:syntastic_jshint_conf")
    let g:syntastic_jshint_conf = "~/.vim/vim_jshint.json"
endif

function! SyntaxCheckers_javascript_GetLocList()

    if empty(g:syntastic_jshint_conf)
        let jsconf = ""
    else
        let jsconf = " --config " . g:syntastic_jshint_conf
    endif

    let makeprg = "jshint ".shellescape(expand('%'))." --reporter ".g:syntastic_jshint_reporter.jsconf

    let errorformat='%f @ %l:%c %m'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })

endfunction

