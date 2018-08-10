"
" NEOBUNDLE SECTION
"
" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ~~~~~~~~ MY BUNDLES HERE ~~~~~~~~~
"
" Note: You don't set neobundle setting in .gvimrc!
"

NeoBundle 'flazz/vim-colorschemes' " Extra colorschemes
NeoBundle 'tpope/vim-airline' " awesome status line
NeoBundle 'nathanaelkane/vim-indent-guides' " visualize indents
let g:indent_guides_enable_on_vim_startup = 1 " enable on startup
NeoBundle 'tpope/vim-commentary' " Commenting - Type gcc for one line, or gc*
NeoBundle 'tpope/vim-repeat' " Plugin that other plugins use. Makes the repeat command '.' work
NeoBundle 'tpope/vim-fugitive' " Git wrapper.
let minWidth = 4
let maxWidth = 40
"set statusline+=\[%h%m%r%{strpart(fugitive#statusline(),minWidth,maxWidth)} " manipulate string given by fugitive
"set statusline+=\ %f "filename
NeoBundle 'shumphrey/fugitive-gitlab.vim' " gitlab plugin for vim-fugitive
let g:fugitive_gitlab_domains = ['http://git', 'http://git.tcncloud.net'] " for private gitlab domains
NeoBundle 'tpope/vim-rhubarb' " echo 'machine api.github.com login <user> password <token>' >> ~/.netrc

" Go plugins
NeoBundle 'fatih/vim-go'
NeoBundle 'mdempsky/gocode'

" editor config
NeoBundle 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " makes fugitive work with this plugin

" ~~~~~~~~~~~ END ~~~~~~~~~~~~~

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end() "neobundle end

colorscheme solarized   " Do this first so that later commands aren't overwritten. All hail solarized light
set background=light

set backspace=indent,eol,start

" set guifont=Fira\ Code:h18
set lines=50 " initial window size
set columns=300 " initial window size

set term=xterm-256color
set t_Co=256        " use 256 colors
syntax on           " enable syntax processing

set ai

set listchars=tab:»·,trail:·,space:·

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " changes the amount of spaces << and >> move the text
set ignorecase      " ignorecase or infercase? The question of the century.

set number              " show line numbers
set relativenumber      " show line numbers relative to your current line
set cursorline          " highlight current line

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight all search pattern matches

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set synmaxcol=400 "only syntax higlight first 400 columns, increases performance on weird files
set tabpagemax=100 " we can have 100 tabs open. This extends the default
set scrolloff=5 "keep the cursor vertically centered

" ~~~~~~~~~~~Remaps~~~~~~~~~~~~~~~~~``
" map Shift-Space to turn off highlighting and clear any message already displayed.
:nnoremap <CR> :nohlsearch<CR><CR>

nmap j gj
nmap k gk


" Only for MacVim. Bind cmd+num to switch through tabs
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>

" augroup is used to prevent a buildup of autocmd's whenever .vimrc is sourced
augroup autocmds
  "autocmd! " clear the augroup. if this isn't done often vim will be slowed down
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst setlocal spell " spell check for text files

  " press f5 and open a markdown file into google chrome.
  " Requires: https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl
  " Check "Allow access to file URLs in chrome://extensions
  autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome" %:p:.<CR>'

  autocmd FileType gitcommit setlocal spell
  " automatically resize splits when vim is resized
  autocmd VimResized * wincmd =

  " Set conceallevel=0 for every filetype. Conceallevel really is dumb, I hate that ishhhhh
  set cole=0
  autocmd FileType * setl cole=0

  " Comment // for cpp and proto files
  autocmd FileType cpp,cc,proto setlocal commentstring=\/\/\ %s

augroup END
