" Settings {{{
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Add relative line number
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" }}}

" Plugins {{{

filetype plugin indent on


call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'ternjs/tern_for_vim'
Plug 'preservim/nerdtree'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'

call plug#end()

" NERDTree
" open when opening a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" YouCompleteMe
nnoremap gd :YcmCompleter GoToDefinition<CR>
" FZF
nnoremap <silent> <C-f> :FZF<cr>

" vim-go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>f  :GoTestFunc<cr>
autocmd FileType go nmap <C-a>  :GoAlternate<cr>
autocmd FileType go nmap <C-b>  :GoDecls<cr>
autocmd FileType go nmap <C-h>  :GoDeclsDir<cr>
let g:go_fmt_command = "goimports"
let g:go_test_show_name = 1
let g:go_auto_type_info = 1

augroup go
    autocmd!
    autocmd Filetype go
                \  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
                \| command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
                \| command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END


" vim-autoformat
au BufWrite * :Autoformat

" ultisnips

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split
let g:UltiSnipsEditSplit="vertical"

" }}}
