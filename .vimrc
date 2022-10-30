set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'ambv/black'
Plugin 'dense-analysis/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'
call vundle#end()
filetype plugin indent on

syntax on
set hlsearch
set expandtab ts=4 sw=4 sts=4 ai
set smarttab smartindent
set incsearch hlsearch
set laststatus=2
set smartcase ignorecase
set backspace=indent,eol,start

let g:black_linelength = 99

autocmd FileType cpp setlocal ts=2 sw=2 sts=2
autocmd FileType h   setlocal ts=2 sw=2 sts=2
autocmd FileType proto      setlocal ts=2 sw=2 sts=2
autocmd FileType prototxt   setlocal ts=2 sw=2 sts=2
autocmd BufWritePost *.py silent! execute ':Black'
autocmd FileType h,c,cc,cpp,javascript,arduino AutoFormatBuffer clang-format-8

let mapleader = ","

let g:ale_linters = {"python": ["pyright"], "proto": []}
highlight ALEError cterm=NONE ctermbg=DarkRed ctermfg=White
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>at :ALEToggle<cr>

let g:ctrlp_custom_ignore = 'node_modules\|\.git\|thirdparty'

let g:jedi#completions_enabled = 0
