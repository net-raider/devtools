set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required
filetype plugin indent on    " required

set number
inoremap jk <Esc>

" when asking for a completion, automatically choose the first option
inoremap <C-x><C-f> <C-x><C-f><C-n>
inoremap <C-x><C-o> <C-x><C-o><C-n>

let g:python3_host_prog = '/home/netraider/miniforge3/envs/devtools/bin/python'
