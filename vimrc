set nocompatible
filetype off

" Vundle options:
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself (required)
Bundle 'gmarik/vundle'

" My Bundles:
"
" Github repos
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/VimIRC.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/syntastic'

" Gitlab repos
"Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/vimips.git'
"Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/autocomment.git'
"Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/ctrlpgtags.git'

call vundle#end()

filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Handy vanilla Vim settings
set background=dark
set wildmenu
set wildmode=longest,list
set backspace=indent,eol,start
set laststatus=2
set ruler
set scrolloff=3

" Search configuration
set hlsearch
set incsearch
set ignorecase
set smartcase

" Shortcut for enabling folding.
command AddFolds set foldmethod=syntax

" Ironman mode
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Better controls for switching between tabs.
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" Indenting things
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set cino+=(0"
" Special Python indenting
au FileType python setl sw=4

" Highlight trailing whitespace, or whitespace before a tab
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Line number toggling
function! NumberToggle()
  if(&relativenumber != 1 && &number != 1)
    set number
    highlight LineNr ctermfg=gray
  elseif(&relativenumber != 1 && &number == 1)
    set relativenumber
    highlight LineNr ctermfg=darkgray
  else
    set norelativenumber
    set nonumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>
set norelativenumber
set nonumber
