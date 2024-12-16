"LINE NUMBER options
set number
set relativenumber

"SELLING options
set spell

"TAB options
set tabstop=4
"To  switch tab to spaces uncomment next 2 lines
set shiftwidth=0
set expandtab
"Auto indent
"set autoindent

"LINE WRAP options
set nowrap

" Enable syntax highlighting
syntax on

" Ensure filetype detection is enabled
filetype on
filetype plugin on
"Use plugin to determine indentation level based on file type
filetype indent on

" Specific settings for git commit messages
autocmd FileType gitcommit setlocal spell textwidth=72
autocmd FileType gitcommit syntax enable