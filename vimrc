" ==================== "
" DEFAULT VIM SETTINGS "
" ==================== "
set nu
set rnu
set list
syntax enable
set shortmess+=c
colorscheme monokai
set autoindent smartindent
set hidden hlsearch incsearch
set expandtab shiftwidth=2 softtabstop=2

" ====== "
" MACROS "
" ====== "
let s:count = 0
function! EchoCR()
  let s:count += 1
  echomsg 'pressed <CR>; count = '.s:count
  return "\<CR>"
endfunction
inoremap <expr> <cr> EchoCR()

" ============ "
" VUNDLE SETUP "
" ============ "
filetype off
set nocompatible noshowmode
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------------------- "
" Vundle Plugins Here "
" ------------------- "
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/taglist.vim'
" ------------------- "

call vundle#end()
filetype plugin indent on
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

" =============== "
" PLUGIN SETTINGS "
" =============== "
" ----------- "
" Neocomplete "
" ----------- "
set runtimepath+=$HOME/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" ---------- "
"  Syntastic "
"  --------- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -------- "
" NERDTree "
" -------- "
autocmd VimEnter * NERDTree | wincmd p " NERDTree autoload and cursor to text file

" ----- "
" CtrlP "
" ----- "
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
