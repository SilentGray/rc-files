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
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'rking/ag.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'plasticboy/vim-markdown'
Bundle 'klen/python-mode'
Bundle 'derekwyatt/vim-scala'
Bundle 'rust-lang/rust.vim'

" Gitlab repos
Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/vimips.git'
Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/autocomment.git'
Bundle 'ssh://git@gitlab.datcon.co.uk/RyanNorris/ctrlpgtags.git'

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

" Simple plugin settings
let g:sh_no_error = 1
let g:vim_markdown_folding_disabled = 1

" PyMode settings.
let g:pymode = 1
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_ignore = "E265"
let g:pymode_rope = 0
let g:pymode_doc = 1
let g:pymode_folding = 0
"let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 79

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" Disable GCC checking, as it's not feasible with huge codebases.
let g:syntastic_c_checkers=[]

" Go syntax highlighting and stuff.
filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Cscope options:
set csprg=gtags-cscope
set nocsverb
cs add GTAGS
set csverb
"set cscopequickfix=s-,c+,d-,i-,t-,e-
" This one replaces tags with cscope tagging.
set cst
" Cscope shortcuts.
noremap <leader>s :cs<space>f<space>s<space>
map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" Better navigating for references.
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <leader>, :lprevious<CR>
nmap <leader>. :lnext<CR>
nnoremap <C-\>, :lolder<CR>
nnoremap <C-\>. :lnewer<CR>
"nmap <leader>, :lopen<CR>
"nmap <leader>. :lclose<CR>
nmap <C-\>s :lcs f s <C-r><C-w><CR> :lw<CR>

" Ctrl-P options:
set wildignore+=*.tmp,*.swp,*.so,*.zip,*.cache,*.class
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_custom_ignore = {
\ 'dir': '\v((\.git|\.svn)|/(orlandodocs|publicdocs|build|output))',
\ }
let g:ctrlp_max_files = 910000
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" Tag searching wth CtrlP
noremap <leader>g :CtrlPGtags<CR>
set rtp+=$HOME/.vim/bundle/CtrlPGtags
