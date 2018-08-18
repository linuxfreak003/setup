"
" NEOBUNDLE SECTION
" 
" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
"
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" ~~~~~~~~ MY BUNDLES HERE ~~~~~~~~~
"       
" Note: You don't set NeoBundle setting in .gvimrc!

" editor config for syntax
NeoBundle 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " makes fugitive work with this plugin

" extra color schemes
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'fatih/vim-go'
NeoBundle 'mdempsky/gocode'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'arcticicestudio/nord-vim'

" syntax checker

NeoBundle 'tpope/vim-commentary' " Used for commenting! Type gcc for one line, or gc* (example: gcap --comment around paragraph)
NeoBundle 'tpope/vim-repeat' " Plugin that other plugins use. Makes the repeat command '.' work
NeoBundle 'tpope/vim-endwise' " Autocomplete
NeoBundle 'tpope/vim-airline' " Status line
NeoBundle 'vim-airline/vim-airline-themes'

" Git wrapper.
NeoBundle 'tpope/vim-fugitive'
let minWidth = 4
let maxWidth = 40
NeoBundle 'shumphrey/fugitive-gitlab.vim' " gitlab plugin for vim-fugitive
let g:fugitive_gitlab_domains = ['https://git.tcncloud.net'] " for private gitlab domains
NeoBundle 'tpope/vim-rhubarb' " echo 'machine api.github.com login <user> password <token>' >> ~/.netrc


" ~~~~~~~~~~~ END ~~~~~~~~~~~~~
       
" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end() "neobundle end

set t_Co=256

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

" set background=light
colorscheme nord   " Do this first so that later commands aren't overwritten. All hail solarized light

syntax on           " enable syntax processing

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " changes the amount of spaces << and >> move the text
set ignorecase      " ignorecase or infercase? The question of the century.

set clipboard=unnamed,unnamedplus " yanking adds to + and * registers. system clipboard is the * register btw.

set number              " show line numbers
set relativenumber      " show line numbers relative to your current line
set cursorline          " highlight current line

" Allow <C-n> and <C-p> to use the dictionary for recommended words.
set complete+=kspell
" Only spell check SpellLocal and SpellBad (use :h hl-SpellBad)
hi clear SpellCap
hi clear SpellRare

set backupcopy=yes

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight all search pattern matches

" map Shift-Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <CR> :nohlsearch<CR><CR>
:command Dark :colorscheme nord <bar> :AirlineTheme nord
:command Light :colorscheme PaperColor <bar> :AirlineTheme papercolor <bar> set background=light

nmap j gj
nmap k gk

" augroup is used to prevent a buildup of autocmd's whenever .vimrc is sourced
augroup autocmds
  "autocmd! " clear the augroup. if this isn't done often vim will be slowed down
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst setlocal spell " spell check for text files

  " press f5 and open a markdown file into google chrome.
  " Requires: https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl
  " Check "Allow access to file URLs in chrome://extensions
  autocmd BufEnter *.md exe 'noremap <F5> :!google-chrome %:p:.<CR>'

  autocmd FileType gitcommit setlocal spell
  " automatically resize splits when vim is resized
  autocmd VimResized * wincmd =

  " Set conceallevel=0 for every filetype. Conceallevel really is dumb, I hate that ishhhhh
  set cole=0
  autocmd FileType * setl cole=0

  " Comment // for cpp and proto files
  autocmd FileType cpp,cc,proto setlocal commentstring=\/\/\ %s

augroup END
