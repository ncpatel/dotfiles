autocmd FileType python source ~/.vim/python.vim
autocmd FileType html source ~/.vim/html.vim
autocmd FileType css source ~/.vim/css.vim
autocmd FileType ruby source ~/.vim/ruby.vim
autocmd FileType javascript source ~/.vim/js.vim
autocmd FileType c source ~/.vim/c.vim
autocmd FileType cpp source ~/.vim/c.vim

au BufRead,BufNewFile *.md setlocal textwidth=80

filetype plugin on

let mapleader = ","

set wildmode=longest,list,full
set wildmenu
set mousehide
set mousemodel=popup
set ruler
set number
set scrolloff=10
set cursorline
set printoptions=paper:letter
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2

syntax on
colorscheme monokai
set guifont=Meslo\ LG\ S\ 8

let g:pythondiction_location = "~/.vim/ftplugin/pydiction/complete-dict"
let g:python_diction_menu_height = 20

highlight OverLength ctermbg=red ctermfg=white guibg=#592925
match OverLength /\%81v.\+/