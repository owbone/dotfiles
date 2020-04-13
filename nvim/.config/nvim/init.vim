filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'garyburd/go-explorer'
Plug 'git://git.wincent.com/command-t.git'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jodosha/vim-godebug'
Plug 'kien/ctrlp.vim'
Plug 'LnL7/vim-nix'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

filetype plugin indent on

set mouse=a

set t_Co=256
set autoread
set number
set relativenumber
set hidden
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Enable syntax highlighting by default
syntax on

" Fix Ctrl+H for Neovim...
if has('nvim')
    nmap <BS> <C-W>h
endif

" Theme
    " Molokai
    let g:rehash256=1
    let g:molokai_original=0
    colorscheme molokai

    " Transparent background (i.e. match terminal background).
    hi Normal guibg=NONE ctermbg=NONE

" Custom key mappings
    let mapleader=","

    " Insert mode
    imap jk <Esc>
    inoremap <C-k> <C-o>gk
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
    inoremap <C-j> <C-o>gj

    map <leader>g :YcmCompleter GoToDefinitionElseDeclaration
    map <C-n> :NERDTreeToggle<CR>

" NERDTree configuration
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "◇",
        \ "Staged"    : "◈",
        \ "Untracked" : "○",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "⨯",
        \ "Dirty"     : "∗",
        \ "Clean"     : "∙",
        \ 'Ignored'   : "◌",
        \ "Unknown"   : "?"
        \ }

" Deoplete configuration
    let g:deoplete#complete_method='omnifunc'

    " Go configuration
    let g:deoplete#sources#go#gocode_binary='~/workspace/bin/gocode' " Recommended for speed
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

    " Tab completion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NERDTree configuration
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Buffergator configuration
    let g:buffergator_viewport_split_policy = "T"

" Syntastic configuration
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

" Airline configuration
    let g:airline_theme='deus'
    let g:tmuxline_powerline_separators=1
    let g:airline_powerline_fonts=1
    let g:Powerline_symbols='unicode'
    let g:airline_enable_branch=1
    let g:airline#extensions#tmuxline#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_buffers=1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" Go configuration
    " vim-go configuration
    let g:go_metalinter_autosave=1
    let g:go_metalinter_autosave_enabled=['vet', 'golint']
    let g:go_metalinter_deadline="5s"
    let g:go_fmt_command="goimports"
    let g:go_fmt_fail_silently=0
    let g:go_highlight_types=1
    let g:go_highlight_fields=1
    let g:go_highlight_functions=1
    let g:go_highlight_methods=1
    let g:go_highlight_extra_types=1
    let g:go_highlight_build_constraints=1
    let g:go_highlight_generate_tags=1
    let g:go_auto_type_info=1 " Automatically show identifier info
    let g:go_auto_sameids=1 " Automatically highlight matching identifiers
    let g:go_term_enabled=1
    let g:go_term_mode="vsplit"

    " Use deoplete for autocompletion
    autocmd FileType go call deoplete#enable()

    " Go visual configuration
    autocmd FileType go setlocal cc=80

    " Go key mappings
    autocmd FileType go nmap <leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>gi <Plug>(go-info)

" Python configuration
	let python_highlight_all=1

" Highlight extra whitespace
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
