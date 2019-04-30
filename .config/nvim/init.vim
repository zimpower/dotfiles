
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi' " autocompletion source
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

filetype plugin indent on
syntax on

" Tab indent, settings
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Python settings
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" NERDTree setup
" Close nvim if NERDTree last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set termguicolors
colorscheme neodark

" Line Number setup
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Map NERDTree to Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Map FZF to Ctrl-p
map <C-p> :FZF<CR>


" Navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" deoplete.nvim, deoplete-jedi
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#jedi#show_docstring = 1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#enable_smart_case = 1

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
nnoremap <esc> :noh<return><esc>
" Press i to enter insert mode, and jj to exit.
:imap jj <Esc>
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
