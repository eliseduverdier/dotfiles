set nocompatible        "  enable vim features, depending on the terminal
filetype on             " for syntax
syntax enable
let mapleader = "²"     " define the leader key

" autoindenting, with 4 spaces
    set autoindent
    set expandtab
    set smarttab
    set smartindent
    set shiftwidth=4
    set softtabstop=4
    set linebreak
    " set backspace=4
    " set showmatch           " Show matching brackets.
    " set mat=2		  " How many tenth of a second to blink when matching brakets

""" search
    set ignorecase      " ignore case or search word
    set smartcase       " except when search term uses a capital letter
    set incsearch       " search while typing
    set hlsearch        " highlight all searches

set pastetoggle=<F1>    " avoid autoindenting

" [un]indent width [tab-]shift
    vmap <Tab> >gv
    vmap <S-Tab> <gv
    imap <S-Tab> <C-d>
    nnoremap <Tab> >>
    nnoremap <S-Tab> <<

""" mapping commands 
    " change syntax
    nnoremap js :set syntax=javascript<CR>
    nnoremap txt :set syntax=<CR>
    nnoremap php :set syntax=php<CR>
    nnoremap xml :set syntax=xml<CR>
    "  insert line break from normal mode
    nnoremap <leader>j i<CR><Esc>
    " change all instances of word under cursor
    nnoremap <leader>s :%s/\<<C-r><C-w>\>/


""" interface
    set cursorline      " highlight current line
    set nu              " line numbers
    set wildmenu        " show files completion
    
    " navigate between splits
    noremap <leader><Up> <ESC><C-w><Up>
    noremap <leader><Down> <ESC><C-w><Down>
    noremap <leader><Left> <ESC><C-w><Left>
    noremap <leader><Right> <ESC><C-w><Right>

    " resize the vertical splits
    noremap <leader>+ :vertical resize +20<CR>
    noremap <leader>- :vertical resize -20<CR>

    " status line:   [buffer nb] |    file path [modified] | [type]    ...  line:col/total   position
    set laststatus=2
    set statusline=
    set statusline+=\ %n\ \ 
    set statusline+=%1*                      " switch highlight
    set statusline+=\ %30F\ \%m\             " show file
    set statusline+=%*                       " switch back to normal statusline highlight
    set statusline+=\ %y\ %=\ %l:%c/%L\ \ %P\    " line:col/total  position

" colors
    " cterm = {bold, underline, reverse, italic, none}
    " for ctermbg and ctermfg list, see :h cterm-colors 
    " for thins to set up, see :so $VIMRUNTIME/syntax/hitest.vim
    hi LineNr       ctermfg=white       cterm=bold  
    hi CursorLine   ctermbg=lightgray   cterm=none
    hi Special      ctermfg=DarkYellow  cterm=none  
    hi Constant     ctermfg=Cyan        cterm=none
    hi String       ctermfg=DarkYellow  cterm=none
    hi Character    ctermfg=Cyan        cterm=none
    hi Number       ctermfg=Cyan        cterm=none
    hi MatchParen   ctermbg=Yellow
    hi Boolean      ctermfg=Cyan        cterm=none
     
    hi Comment     ctermfg=darkgrey
    hi pythonComment ctermfg=darkgrey

    " status line color
    hi User1        ctermbg=LightGreen  ctermfg=white    cterm=bold
    hi StatusLine   ctermfg=white       ctermbg=black    cterm=bold
    hi StatusLineNC ctermfg=white        ctermbg=grey    cterm=none
    
" snippets
" source .vim_snippets
" 
