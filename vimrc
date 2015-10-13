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

" ============  "
" KEY MAPPINGS "
" ============  "
set backspace=indent,eol,start

" =============== "
" GOLANG SETTINGS "
" =============== "
nmap <F2> :GoRename<CR>
imap <F2> <ESC>:GoRename<CR>
nmap <F3> :GoReferrers<CR>
imap <F3> <ESC>:GoReferrers<CR>a
map <F4> :GoImplements<CR>
imap <F4> <ESC>:GoImplements<CR>a
map <F5> :GoCallees<CR>
imap <F5> <ESC>:GoCallees<CR>a
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
