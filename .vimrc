" --------------------------------------------
"   .vimrc
" 
" leader shortcuts:
"   j : insert line break from normal mode
"   s : remove trailing spaces
"   r : change all instances of word under cursor
"   / : comment line
"   b : toggle background
"   c : commentThosLines()
"   Up, Down, Left, Right : navigate between splits
"   +, - : resize vertical splits with ± 20 char
"
" else:
"   F3: toggle autoindenting while pasting
"   <lang>: set syntax according to that language
" --------------------------------------------

" init {{{
set nocompatible        "  enable vim features, depending on the terminal
filetype on             " for syntax
syntax enable
let mapleader = "²"     " define the leader key
" }}}

" autoindenting, with 4 spaces {{{
    set autoindent
    set expandtab
    set smarttab
    set smartindent
    set shiftwidth=4
    set softtabstop=4
    set linebreak
    " set backspace=4
    " set showmatch       " Show matching brackets.
    " set mat=2		  " How many tenth of a second to blink when matching brakets
" }}}

" folds {{{
setlocal foldmethod=marker
" }}}

" search {{{
    set ignorecase      " ignore case or search word
    set smartcase       " except when search term uses a capital letter
    set incsearch       " search while typing
    set hlsearch        " highlight all searches
" }}}

" F# keys {{{
set pastetoggle=<F3>    " avoid autoindenting
inoremap <F4> <C-R>=strftime("%F")<CR>
" }}}

" mappings {{{
    " (un)indent with (S)tab
    vmap <Tab> >gv
    vmap <S-Tab> <gv
    imap <S-Tab> <C-d>
    nnoremap <Tab> >>
    nnoremap <S-Tab> <<

    " autocompletion
    " imap <Tab> <C-n>

    " change syntax
    nnoremap js   :set syntax=javascript<CR>
    nnoremap txt  :set syntax=<CR>
    nnoremap php  :set syntax=php<CR>
    nnoremap xml  :set syntax=xml<CR>
    nnoremap html :set syntax=html<CR>
    nnoremap sh   :set syntax=sh<CR>
    nnoremap vim  :set syntax=vim<CR>

    "  insert line break
    nnoremap <leader>j i<CR><Esc>

    " remove trailing spaces
    noremap <leader>s :%s/\s\+$//g<CR>
    
    " change all instances of word under cursor
    nnoremap <leader>r :%s/\<<C-r><C-w>\>/
    
    " toggle background
    noremap <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

    " copy til EOL
    map Y y$          
" }}}

" comments {{{
    function CommentThoseLines() range
        if &syn == 'xml' || &syn == 'html'
            '<s/^\(.*\)$/\<!-- \1/g
            '>s/^\(.*\)$/\ \1 -->/g
            return
        elseif &syn=='vim'
            let char = '"'
        elseif &syn=='apache' || &syn=='python' || &syn=='sh'
            let char = '#'
        else
            let char = '//'
        endif
        '<,'>s/^/\=l:char/g
        " add the comment characther at the start of the selected lines
    endfunction

    vmap <leader>c :call CommentThoseLines()<CR>
    
    " comment line
    nnoremap <leader>/ <Esc>^i//<Esc>
" }}}

" interface {{{
set cursorline      " highlight current line
"set nu              " line numbers
"set relativenumber  " current line is line number, above and belows are relative :)
set wildmenu        " show files completion

" navigate between splits
noremap <leader><Up> <ESC><C-w><Up>
noremap <leader><Down> <ESC><C-w><Down>
noremap <leader><Left> <ESC><C-w><Left>
noremap <leader><Right> <ESC><C-w><Right>

" resize the vertical splits
noremap <leader>+ :vertical resize +20<CR>
noremap <leader>- :vertical resize -20<CR>

" gvim specific
if has('gui_running')
  set guifont=agave\ 12
  colorscheme desert
endif

" }}}

" sources {{{

" STATUS LINE
source ~/.vim/status_line.vim
" bug with Vblock make it disappear

" PLUGINS
" execute pathogen#infect()

" colors
source ~/.vim/colors.vim

" snippets
source ~/.vim/snippets.vim
" }}}
