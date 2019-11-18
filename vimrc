" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
" turn on this option as well
"set background=dark

filetype on

colorscheme delek
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number
set backupdir=~/Documents/vim/vimBackup/
set undodir=~/Documents/vim/vimBackup/
set spelllang=en
set textwidth=0
set nohls
set nu
set guioptions-=m
set guioptions-=T
set clipboard=unnamedplus

map <F2> i

inoremap <F9> "+P
inoremap <F5> #!/bin/sh<CR>
"Enable folding
set foldmethod=indent
set foldlevel=99

"for indents
au BufNewFile,BufRead *.java
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8

"Java syntax highlighting
"autocmd! FileType c,cpp,java,php call CSyntaxAfter()

function! CSyntaxAfter()
	syntax keyword Boolean true false NULL TRUE FALSE
	syntax keyword Statement abstract continue for new default package synchronized boolean do if private this break double implements protected throwbyte else import public throws case enum instanceof return transient catch extends int short try char final interface static void class finally long	volatile float native super while

	syntax match _Block "[{}]"
	syntax match _Bracket "[\[\]]"
	syntax match _Operator "[-+&|<>=!\/~.,;:*%&^?()]"
	syntax region _Comment start="\/\*" end="\*\/" contains=@Spell
	syntax match _Comment "\/\/.*$" contains=@Spell

	hi _Block guifg=yellow1 guibg=NONE gui=none
	hi link _Bracket Constant
	hi link _Operator Operator
	hi link _Comment Comment
endfunction


"Ibeam in insert block in normal mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" set the terminal transparant
hi Normal guibg=NONE ctermbg=NONE
