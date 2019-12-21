" setup onedark colour scheme and lightline status line
let g:lightline = {
 \ 'colorscheme': 'onedark',
 \ }
colorscheme onedark

"  no vi-compatible
set nocompatible
let g:pymode_python = 'python3'

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
syntax on

" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" tab length exceptions on some file types
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Setup buffer change
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Line Number setup
set number relativenumber
augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Map the leader key to SPACE/
let mapleader="\<SPACE>"

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
 set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Searching settings
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " incremental search
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use ESCAPE to clear the highlighting of :set hlsearch.
nnoremap <Esc> :noh<return><Esc>
" Press i to enter insert mode, and jj to exit.
:imap jj <Esc>
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
