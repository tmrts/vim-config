" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

" General {

    filetype plugin indent on
    syntax on
    scriptencoding utf-8

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Setting up the directories {
	
        set backup
        if has('persistent_undo')
            set undofile
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

    " }

" }

" Vim UI {

    if &term == 'xterm' || &term == 'tmux'
        set t_Co=256            " Enable 256 colors
    endif

    if filereadable(expand("~/.vim/colors/molokai.vim"))
        colorscheme molokai
    endif

    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    set relativenumber              " Relative line numbers on
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when there are upper cases
    set wildmenu                    " Show list instead of just completing
    set foldenable                  " Auto fold code

" }

" Formatting {

    set noswapfile                  " No more pesky swap files
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current

    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

" }

" Key (re)Mappings {

    if !exists('g:leader_')
        let mapleader = ','
    else
        let mapleader=g:leader_
    endif

    if !exists('g:noEasyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

" }

" Plugins {

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
    " }

    " PyMode {
        let g:pymode_lint_checker = "pyflakes"
        let g:pymode_utils_whitespaces = 0
        let g:pymode_options = 0
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    "}
    
    " To turn off use assign 0 to global var omni_complete
    " Vim omni-completion {
        if exists('g:omni_complete')
            " Enable omni-completion.
            autocmd FileType css            setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby           setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell        setlocal omnifunc=necoghc#omnifunc
        endif
    "}
" }

" GUI Settings {

    if has('gui_running')
        set guioptions=M           " Remove toolbars
        set lines=999 columns=999
    else
        set lines=50 columns=100
    endif

" }
