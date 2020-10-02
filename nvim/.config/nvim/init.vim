filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'garyburd/go-explorer'
Plug 'git://git.wincent.com/command-t.git'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jodosha/vim-godebug'
Plug 'LnL7/vim-nix'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
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

" Custom key mappings
    let mapleader=","

    " Insert mode
    imap jk <Esc>
    inoremap <C-k> <C-o>gk
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
    inoremap <C-j> <C-o>gj

" NERDTree configuration
    map <C-n> :NERDTreeToggle<CR>

" coc.nvim configuration
    set shortmess+=c

    let g:coc_global_extensions = ['coc-lists', 'coc-tabnine', 'coc-java', 'coc-go']

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Fuzzy finders
    nmap <C-p> :CocList files<CR>
    nmap <leader>lo :CocList --normal -A outline<CR>
    nmap <leader>ls :CocList --normal -A --interactive symbols<CR>
    nmap <leader>lf :CocList --normal -A files<CR>
    nmap <leader>ll :CocList --normal -A --interactive lines<CR>

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" NERDTree configuration
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Buffergator configuration
    let g:buffergator_viewport_split_policy = "T"

" Airline configuration
    let g:airline_theme='molokai'
    let g:tmuxline_powerline_separators=1
    let g:airline_powerline_fonts=1
    let g:Powerline_symbols='fancy'
    let g:airline_enable_branch=1
    let g:airline#extensions#tmuxline#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_buffers=1

    " air-line
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

" Go configuration
    " vim-go configuration
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

    " Go visual configuration
    autocmd FileType go setlocal cc=80

" Python configuration
    let python_highlight_all=1

" Highlight extra whitespace
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
