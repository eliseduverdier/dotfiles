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
"   F3: toggle autoindenting while pasting
"   <lang>: set syntax according to that language
" --------------------------------------------

" init {{{
    set nocompatible        "  enable vim features, depending on the terminal
    filetype on             " for syntax
    syntax enable
    set t_Co=256
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
    nnoremap mkd  :set syntax=markdown<CR>

    "  insert line break
    nnoremap <leader>j i<CR><Esc>

    " remove trailing spaces
    " noremap <leader>S :%s/\s\+$//g<CR>
    
    " replace all occurences of word under cursor
    nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
    
    " change all instances of word under cursor
    nnoremap <leader>r :%s/\<<C-r><C-w>\>/
    
    " toggle background
    noremap <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

    " copy till EOL
    map Y y$          
" }}}

" functions {{{
    " comments
    if exists("*s:CommentThoseLines")
        function CommentThoseLines() range
            if &syn == 'xml' || &syn == 'html'
                '<s/^\(.*\)$/\<!-- \1/g
                '>s/^\(.*\)$/\ \1 -->/g
                return
            elseif &syn=='vim'
                let char = '"'
            elseif &syn=='apache' || &syn=='python' || &syn=='sh' || &syn=='yml'
                let char = '#'
            else
                let char = '//'
            endif
            '<,'>s/^/\=l:char/g
            " add the comment characther at the start of the selected lines
        endfunction
    endif

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
    endif
    
    " colors
    " source ~/.vim/colors.vim
    colorscheme desert
    set background=light
    " colorscheme solarized
" }}}

" sources {{{
    " STATUS LINE
    source ~/.vim/status_line.vim

    " snippets
    source ~/.vim/snippets.vim
" }}}

" plugins {{{
"   set rtp+=~/.vim/bundle/Vundle.vim
"   call vundle#begin()
"   Plugin 'VundleVim/Vundle.vim'
"   Plugin 'scrooloose/nerdtree'
"   Plugin 'tpope/vim-surround'
"   "Plugin 'morhetz/gruvbox'
"   "   colorscheme gruvbox

"   call vundle#end()            " required
"   filetype plugin indent on    " required
" }}}
