set nu
set ai
set tabstop=4
set shiftwidth=4
set listchars=tab:»·,trail:·,space:·
nmap j gj
nmap k gk
syntax on
colo desert
filetype plugin indent on
hi Normal ctermbg=none
autocmd BufRead,BufNewFile *.txt setlocal spell
