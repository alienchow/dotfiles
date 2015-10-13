" ==================== "
" DEFAULT VIM SETTINGS "
" ==================== "
syntax enable
set relativenumber
set number
colorscheme monokai

" ============ "
" VUNDLE SETUP "
" ============ "
filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------------------- "
" Vundle Plugins Here "
" ------------------- "
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" ------------------- "

call vundle#end()
filetype plugin indent on

" ===================== "
" Plugin Configurations "
" ===================== "
:au VimEnter *  NERDTree " NERDTree auto open
