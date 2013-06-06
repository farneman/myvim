" .vimrc File
" Maintained by: Josh Farneman
" josh@farneman.net
" http://farneman.net


call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Forget compatibility with Vi. Who cares.
set nocompatible

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Write the old file out when switching between files.
set autowrite

" Display current cursor position in lower right corner.
set ruler

" Ever notice a slight lag after typing the leader key + command? This lowers
" the timeout.
set timeoutlen=500

" Switch between buffers without saving
set hidden

" Set the color scheme. Change this to your preference.
colorscheme badwolf

" Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Inconsolata:h14

" Tab stuff
set tabstop=2
set noexpandtab
set shiftwidth=2
set softtabstop=2

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
   
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
   
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
   
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " filetype settings for django
  au BufNewFile,BufRead admin.py     setlocal filetype=python.django
  au BufNewFile,BufRead urls.py      setlocal filetype=python.django
  au BufNewFile,BufRead models.py    setlocal filetype=python.django
  au BufNewFile,BufRead views.py     setlocal filetype=python.django
  au BufNewFile,BufRead settings.py  setlocal filetype=python.django
  au BufNewFile,BufRead forms.py     setlocal filetype=python.django

  au BufNewFile,BufRead urls.py      setlocal nowrap
  au BufNewFile,BufRead settings.py  normal! zR
  au BufNewFile,BufRead dashboard.py normal! zR

  " JS file settings
  au FileType javascript setlocal foldmethod=marker
  au FileType javascript setlocal foldmarker={,}
endif

" Switch filetypes
nnoremap _dt :set ft=htmldjango<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _ss :set ft=css syn=scss<CR>
nnoremap _r :retab!<CR>


set modeline

" Show command in bottom right portion of the screen
set showcmd

" Show lines numbers
set number

" Indent stuff
set smartindent
set autoindent

" Always show the status line
set laststatus=2

" Prefer a slightly higher line height
set linespace=3

" Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" Set incremental searching
set incsearch

" Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

" Hide MacVim toolbar by default
set go-=T

" show invisibles
set list
set listchars=tab:……,trail:¬,eol:¶

" enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

set foldmethod=marker

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Split windows below the current window.
set splitbelow              

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

" Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

" Saves time; maps the spacebar to colon
nmap <space> :

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

" Auto-completion menu
set wildmode=list:longest

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Map escape key to jj -- much faster
imap jj <esc>

" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Bubble single lines (kicks butt)
" http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" Reload snipmate
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap <leader>rr :call ReloadSnippets(snippets_dir, &filetype)<CR>


" ------------------------ "
" NERDTREE PLUGIN SETTINGS
" ------------------------ "
" Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

" Show hidden files in NerdTree
let NERDTreeShowHidden=1

" autopen NERDTree and focus cursor in new document
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 


" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Saves file when Vim window loses focus
" au FocusLost * :wa

" Save folds
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Backups
set backupdir=~/.vim/tmp/backups// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup

" No more stretching for navigating files
" noremap h ;
" noremap j h
" noremap k gj
" noremap l gk
" noremap ; l

" show matching brackets
set showmatch

" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi

" Setup ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
