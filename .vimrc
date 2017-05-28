
" vbundle settings  ---------------------- {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" install nerd-tree
Plugin 'scrooloose/nerdtree'
" install ctrlp
Plugin 'kien/ctrlp.vim'
" install surround
Plugin 'tpope/vim-surround'
" install ag grepper
Plugin 'rking/ag.vim' 
" install grep replacer
Plugin 'skwp/greplace.vim'
" install nerd commenter
Plugin 'scrooloose/nerdcommenter'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 " :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line

"}}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" leader is
let mapleader = ";"

let g:enable_jump_normal = 1

" pr means print
iabbrev pr print()

" edit mod remaps of Cheng s3341458 ---------------------- {{{
" obvious cursor movement will cause vim enter command mod
function! TurnOnJumpNormalShortcuts()
    inoremap jk <esc>
    inoremap jj <esc>
    inoremap hh <esc>
    inoremap lll <esc>
    inoremap kk <esc>
    inoremap kj <esc>
endfunction

function! TurnOffJumpNormalShortcuts()
    inoremap jk jk
    inoremap jj jj
    inoremap hh hh
    inoremap lll lll
    inoremap kk kk
    inoremap kj kj
endfunction

call TurnOnJumpNormalShortcuts()

" can delete entire line on edit
inoremap <c-d> <esc>ddi

" can delete previous word on edit
inoremap <c-e> <esc>eldbi

" can delete next word on edit
inoremap <c-b> <esc>bhdei

" }}}

" normal mod remaps of Cheng s3341458 ---------------------- {{{
" disable arrow keys
nnoremap <leader>tm :call ToggleModeJump()<cr>

function! ToggleModeJump()
    if g:enable_jump_normal
        call TurnOffJumpNormalShortcuts()
        echo "disable mormal jump"
        let g:enable_jump_normal = 0
    else
        call TurnOnJumpNormalShortcuts()
        echo "enable mormal jump"
        let g:enable_jump_normal = 1
    endif
endfunction

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" navigate to different window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" H move the first of the line, L move to the last of the line
nnoremap H ^
nnoremap L $

" space to select the cursor in word
noremap <space> viw

" can wrap word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" short cut for edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" active vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" - will move line to line blow
nnoremap - ddp

" = will move line to line up
nnoremap = ddkP

" grep shortcuts
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <leader>G :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" my operator from learn vimscript the hard way
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" }}}

" visual mod remaps of Cheng s3341458 ---------------------- {{{
" wrap select text wih " or '
vnoremap <leader>" c""<esc>bp
vnoremap <leader>' c''<esc>bp

" H move the first of the line, L move to the last of the line
vnoremap H ^
vnoremap L $

" type // to search selected text of current file
vnoremap // y/<C-R>"<CR>

" able to copy things and paste things outside vim"
vnoremap <C-c> "+y

" grep selected word
vnoremap <leader>g :execute "grep! -R " . shellescape(expand('<,'>)) . " ."<cr>:copen<cr>
" }}}

" command mode remaps of Cheng s3341459 ---------------------- {{{
" shortcut grep search

" }}}

" auto comment out the javascript and python
augroup lang_short_cuts
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <c-c> I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
    autocmd FileType python nnoremap <buffer> <c-c> I#<esc>
    autocmd FileType python     :iabbrev <buffer> iff if:<left>
augroup END

" highlight white space of trailing space
augroup highlight_trailing_space
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" status indicator
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "fisetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" settings of Cheng s3341458 ---------------------- {{{
" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
let &ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
let &shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" hightlight matched pattern of search last typed
set hlsearch

" hightlight matched pattern of search when typing
set incsearch

" enable all Python syntax highlighting features
let python_highlight_all = 1

set autowriteall

" always split on right
set splitright

" be case sensitive
set noignorecase

" open quick fix window in a new tab
  set switchbuf+=newtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" pathogen plugin support
filetype off

execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" }}}

" set my email address
iabbrev @@ chengyu0316@gmail.com

" Vimscript file settings ---------------------- {{{
 augroup filetype_vim
     autocmd!
     autocmd FileType vim setlocal foldmethod=marker
 augroup END
     " }}}

" welcome words of Cheng s3341458 ---------------------- {{{
echo "o(^3^)o"
if "foo" == "FOO"
    echo "this vim is case insensitive"
elseif "foo" == "foo"
    echo "this vim is case sensitive"
endif
" }}}

" pymode plugin customization ---------------------- {{{
    " I always using python 3 so pymode checker should using python 3
    "let g:pymode_python = 'python3'
    " do not like too serious syntax checker
    "let g:pymode_lint_checkers = ['']
    "set runtimepath-=~/.vim/bundle/python-mode
" }}}

" nerd tree plugin customization ---------------------- {{{
    " Ctrl + n toggle nerdTree
    map <C-n> :NERDTreeToggle<CR>
" }}}

" ag plugin customization ---------------------- {{{
nnoremap <leader>a :set operatorfunc=<SID>AgOperator<cr>g@
vnoremap <leader>a :<c-u>call <SID>AgOperator(visualmode())<cr>

function! s:AgOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
            normal! `<v`>y
    elseif a:type ==# 'char'
            normal! `[v`]y
    else
            return
    endif

    execute "Ag -Q " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction

" }}}
