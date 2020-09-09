" Environment {
    " Basic {
        set nocompatible " Must be the first line, unlike vi
    " }
" }

" Bundles {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
"}

" General {
    filetype plugin indent on " Automatically detect file types
    syntax on " syntax highlighting
    "set mouse=a " Automatically enable the mouse usage
    set mousehide " Hide the mouse cursor while typing
    scriptencoding utf-8

    " enable the clipboard
    if has('clipboard')
        if has('unnamedplus') " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else " on Mac & Windows, only use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set history=1000 " 20 by default
    " set spell " enable the spelling check
    set iskeyword-=.
    set iskeyword-=-
    set iskeyword-=#
" }

" VIM UI {
    set showmode " Display the current mode
    set cursorline " Highlight the current operating line
    set number " Display the line number

    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd
    endif

    if has('statusline')
        set laststatus=2 " display the statusline at the last two line

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start " More real backspace
    set linespace=0 " No extra spaces between rows
    set foldmarker={,}
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    set showmatch
    set hlsearch
    set ignorecase
    set smartcase " Only Work with ignorecase

    set splitright " Puts new vsplit windows to the right of the current
    set splitbelow " Puts new split windows to the bottom of the current

    set wildmenu " Show list instead of just completing
    set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
" }

" Formatting {
    set nowrap " Don't wrap long lines
    set autoindent " Indent at the same level of the previous line
    set shiftwidth=4 " Use indents of 4 spaces
    set expandtab " Tabs are spaces, instead of tabs
    set tabstop=4 " Use spaces to represent the tab(\t)
    set softtabstop=4 " Let backspace delete indent
    set pastetoggle=<F12> " pastetoggle(sane indentation on pastes)

    autocmd BufNewFile,BufRead *.vue set filetype=vue
    autocmd FileType vue,c,cpp setlocal expandtab shiftwidth=2 softtabstop=2
" }

" Other Settings {

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }

" Key (re)Mappings {
    let mapleader = ','
    nnoremap <C-X> :bn<CR>
    nnoremap <C-A> :bp<CR>
    nnoremap <C-D> :bw<CR>
    noremap <Leader>y "+y
    noremap <Leader>p "+p

    nmap <silent> <leader>/ :nohlsearch<CR>

    " For when you forget to sudo.. Really write the file
    cmap w!! w !sudo tee % >/dev/null
" }

" Functions {
" }

" Plugin Configs {

    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }

    " TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
        endif
    "}

    " Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            " Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    "}

    " colorscheme {
        set t_Co=256
        colorscheme gruvbox
        set background=dark
    " }

    " vim-airline {
        if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
            let g:airline_theme = 'minimalist'
            let g:airline_powerline_fonts = 1
        endif
    " }

" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
