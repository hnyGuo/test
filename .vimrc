"***********************************************************************
"  > File Name   : .vimrc
"  > Author      : Guo Heng
"  > Mail        : ghgood@sjtu.edu.cn
"  > Created Time: Fri 23 Sep 2016 09:55:29 PM CST
"***********************************************************************

"--------------------------------START----------------------------------

"""""""""""""""""""""""""""""Basic Setting""""""""""""""""""""""""""""""

" When started as "evim", evim.vim will already have done these settings
if v:progname =~? "evim"
  finish
endif

" Set default encoding
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" Set color256 to make vim color support the terminal
set t_Co=256

" Set indent
set smartindent

" Set background
colorscheme molokai 
set background=dark

" Use Vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect
set nocompatible

" How many lines to store in the history file
set history=200

" Display comfirm information when handle unsaved or read-only file 
set confirm

" Share clipboard with windows
set clipboard+=unnamed

" Detect file type
filetype off

" Load specific indent file for certain file
filetype indent on

" Avoid separating when words with following characters
set iskeyword+=_,$,@,%,#,-

" Syntax highlight
syntax enable
syntax on

" Hide the toolbar of GUI
set guioptions=P

" Don't backup
set nobackup

" Don't make swap file
setlocal noswapfile

" Pixel line amount between charaters
set linespace=0

" Display row and col numbers on status bar
set ruler

" Command line height
set cmdheight=1

" Let (bs) deal with indent,eol,start
set backspace=indent,eol,start

" Let (bs) and cursor jump line boundary
set whichwrap+=<,>,b,s,[,]

" Error bells
" set noerrorbells

" Highlight matched brackets
set showmatch

" Highlight time for matched brackets(0.5s)
set matchtime=5

" Ignore case when search
set ignorecase

" Don't Highlight the phrases searched
set nohlsearch

" Set increase search
set incsearch

" Inherient indent of last line
" set autoindent

" Display line number
set number

" Tab is 4
set tabstop=4

" Uniform indent 4
set softtabstop=4
set shiftwidth=4

" Don't replace tab with space
set noexpandtab

" Use tab when line or paragraph starts
set smarttab

"Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" <Ctrl+A>select all,<Ctrl+C>copy,<Ctrl+V>paste
map <C-A> ggvG$
imap <C-A> <Esc>ggvG$
vmap <C-C> "+y<Esc>
map <C-V> "+p
imap <C-V> <Esc>"+pa

" Automatch for brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Set <leader> and <localleader>
let mapleader = ","
let maplocalleader = "."

" Permit folding
set foldenable
set foldmethod=manual

" Auto update .vimrc
map <leader>vo <Esc>:vsp ~/.vimrc<CR>


"""""""""""""""""""""""""""""""Vundle Setting""""""""""""""""""""""""""

" Set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle,required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" ..to be continue
Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

"Plugin 'Lokaltog/vim-powerline'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'

" All Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""Plugin Setting""""""""""""""""""""""""""
""""""""""""Ctags
set tags=./tags,./../tags,./*/tags
map <F7> <Esc>:!ctags -R <CR><CR>

""""""""""""Tagbar
autocmd VimEnter * Tagbar
" Don't show "press F1 for help"
let g:tagbar_compact=1
" Window position
let tagbar_left=0
" Window width
let tagbar_width=31
" Hot Key
nnoremap <silent> <F3> :TagbarToggle<CR>

""""""""""""Nerdtree
" Enforce display effect
let NERDChristmasTree=1
" Auto focus
let NERDTreeAutoCenter=1
" Mouse mode: Single Click for Tree,double for file
let NERDTreeMouseMode=2
" Auto close after file opened
let NERDTreeQuitOnOpen=0
" Display file
let NERDTreeShowFiles=1
" Display hidden files
let NERDTreeShowHidden=0
" Highlight current file name or directionary
let NERDTreeHighCursorline=1
" Show line numbers
let NERDTreeLineNumbers=1
" Window position
let NERDTreeWinPos='left'
" Window width
let NERDTreeWinSize=31
" Don't display 'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
" Hot key
nnoremap <silent> <F2> :NERDTreeToggle<CR>
" Auto load nerdtree when there is no file opening vim
autocmd vimenter * if !argc() | NERDTree | endif
" Close Nerdtree if there is only him
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""Status line
" Always display the status line
set laststatus=2
" Git Hotness
set statusline+=%{fugitive#statusline()}

if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
""let g:airline_symbols.space="\ua0"
let g:Powerline_symbols='fancy'
set rtp+=/home/robot/.local/lib/python2.7/site-packages/powerline/bindings/vim
let g:airline_powerline_fonts=1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#symbol='!'

""""""""""""Ycm
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf='/home/robot/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_add_preview_to_completion=0

""""""""""""""""""""""""""""""""Compile and Run""""""""""""""""""""""""
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ -std=c++11"
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc


func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc

func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>

map <F6> :call RunResult()<CR>

"""""""""""""""""""Auto insert file header when create .c,.h,.sh,.java file"""" 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
" Define function SetTitle，auto insert file header 
func SetTitle()  
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : Guo Heng") 
        call append(line(".")+2, "  > Mail        : ghgood@sjtu.edu.cn") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "Jump to the EOF after create file
endfunc 
autocmd BufNewFile * normal G

""""""""""""""""""""""""""Raw,waiting to be updated"""""""""""""""""""""

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=java
autocmd BufRead,BUfNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

