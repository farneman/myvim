" author Helder Correia < helder (.) pereira (.) correia (@) gmail (.) com >
" version 1.0
" feel free to modify and/or redistribute this file

set background=dark

hi clear

if exists( "syntax_on" )
    syntax reset
endif

let g:colors_name="h80"

hi Normal	guifg=White		guibg=#000020 ctermbg=/bin/bash: rgb2cterm: command not found

" highlight groups
hi Cursor	guifg=#e3e3e3		guibg=#D74141 ctermfg=/bin/bash: rgb2cterm: command not found
hi VertSplit	guifg=#075554		guibg=#C0FFFF	gui=none ctermfg=/bin/bash: rgb2cterm: command not found
hi Folded	guifg=black  		guibg=#FFC0C0 ctermbg=/bin/bash: rgb2cterm: command not found
hi FoldColumn	guifg=tan    		guibg=#800080 ctermbg=/bin/bash: rgb2cterm: command not found
hi ModeMsg	guifg=#404040		guibg=#C0C0C0 ctermfg=/bin/bash: rgb2cterm: command not found
hi MoreMsg	guifg=darkturquoise	guibg=#188F90 ctermbg=/bin/bash: rgb2cterm: command not found
hi NonText	guifg=#9FADC5		guibg=#334C75 ctermfg=/bin/bash: rgb2cterm: command not found
hi Question	guifg=#F4BB7E ctermfg=/bin/bash: rgb2cterm: command not found
hi Search	guifg=bg     		guibg=fg
hi SpecialKey	guifg=#BF9261 ctermfg=/bin/bash: rgb2cterm: command not found
hi StatusLine	guifg=#c0ffff		guibg=#004443	gui=none ctermfg=/bin/bash: rgb2cterm: command not found
hi StatusLineNC	guifg=#004443		guibg=#067C7B	gui=bold ctermfg=/bin/bash: rgb2cterm: command not found
hi Title	guifg=#8DB8C3 ctermfg=/bin/bash: rgb2cterm: command not found
hi Visual	guifg=black  		guibg=#C0FFC0	gui=bold ctermbg=/bin/bash: rgb2cterm: command not found
hi WarningMsg	guifg=#F60000				gui=underline ctermfg=/bin/bash: rgb2cterm: command not found

" syntax highlighting groups
hi Comment	guifg=#666666 ctermfg=/bin/bash: rgb2cterm: command not found                           gui=italic
hi Constant	guifg=#A9EE5A				gui=bold,italic ctermfg=/bin/bash: rgb2cterm: command not found
hi Identifier	guifg=#555555 ctermfg=/bin/bash: rgb2cterm: command not found
hi Function	guifg=#555555 ctermfg=/bin/bash: rgb2cterm: command not found
hi Statement	guifg=#ff9742 ctermfg=/bin/bash: rgb2cterm: command not found                           gui=bold,italic
hi PreProc	guifg=#F9449A ctermfg=/bin/bash: rgb2cterm: command not found
hi Type		guifg=#55AAFF ctermfg=/bin/bash: rgb2cterm: command not found                           gui=bold,italic
hi Special	guifg=#A9EE8A ctermfg=/bin/bash: rgb2cterm: command not found
hi Todo		guifg=#FFFFFF		guibg=#FF0000 ctermfg=/bin/bash: rgb2cterm: command not found

