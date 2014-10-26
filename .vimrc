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
noremap <C-e> <nop>
noremap H <nop>
noremap K <nop>
noremap L <nop>
noremap M <nop>
noremap N <nop>
noremap S <nop>
noremap T <nop>
noremap V <nop>
noremap k <nop>
noremap l <nop>
noremap n <nop>
noremap s <nop>
noremap t <nop>
noremap v <nop>
" as yet unused
noremap <C-v> <nop>
noremap B <nop>
noremap W <nop>
noremap b <nop>
noremap w <nop>
noremap { <nop>
noremap } <nop>
" make arrow keys useful
inoremap <right> <nop>
inoremap <up> <c-x><c-y>
inoremap <left> <nop>
inoremap <down> <c-x><c-e>
noremap <right> 3zl
noremap <s-right> zL
noremap <up> <c-u>
" TODO doesn't work in rxvt-unicode
"noremap <s-up> <c-y>
noremap <left> 3zh
noremap <s-left> zH
noremap <down> <c-d>
" TODO doesn't work in rxvt-unicode
"noremap <s-down> <c-e>

" make movement keys nice for dvorak
" (h is fine where it is)
noremap t j
noremap n k
noremap s l

" shift makes movement faster
noremap H b
noremap T }
noremap N {
noremap S w

" put s and S somewhere
noremap v s
noremap V S

" put n and N somewhere
noremap l n
noremap L N

" M for 'manual'; free up K
noremap M K

" put t and T somewhere
noremap k t
noremap K T

" visual on home row
noremap e v
noremap E V
noremap <C-e> <C-V>

" split line at cursor
nnoremap j i<cr><esc>k$

" consistency with D
nnoremap Y y$

" prefer ex mode, start in insert
nnoremap : q:i
nnoremap q: :

" execute macro over all lines
vnoremap @q :normal @q<cr>
vnoremap <leader>s :sort<cr>

nnoremap <leader><space> :set hlsearch! hlsearch?<cr>
if exists(":Tabularize")
    " 'e' for "equals"
    nnoremap <leader>ae :Tabularize /=<cr>
    vnoremap <leader>ae :Tabularize /=<cr>
    " 'c' for "colon"
    nnoremap <leader>ac :Tabularize /:\zs<cr>
    vnoremap <leader>ac :Tabularize /:\zs<cr>
endif
" search for non-ascii characters (space and tilde are the limits of
" ascii printable chars)
nnoremap <leader>u /[^ -~]<cr>
nnoremap <leader>d :read !date +\%Y-\%m-\%d<cr>
nnoremap <leader>l :set list! list?<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>o :browse oldfiles<cr>
nnoremap <leader>p :set paste! paste?<cr>
" reload config
nnoremap <leader>r :source $MYVIMRC<cr>
" search for extra space at the end of lines
nnoremap <leader>s / \+$<cr>
" edit .vimrc
nnoremap <leader>v :split $MYVIMRC<cr>
nnoremap <leader>V :edit $MYVIMRC<cr>
nnoremap b :write<cr>
" fold with matching delimiters
nnoremap <leader>z v%:fo<cr>
" }}} bindings
