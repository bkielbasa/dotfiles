" Settings {{{
syntax on

" no auto indent pasted text

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'

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
autocmd FileType go nmap <F6> :GoDebugStepOut<cr>
autocmd FileType go nmap <F7> :GoDebugStep<cr>
autocmd FileType go nmap <F10> :GoDebugNext<cr>
nmap <F9> :GoDebugBreakpoint<cr>

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
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd FileType go let b:autoformat_autoindent=1

" ultisnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetsDir = $HOME."~/.vim/mysnippets"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/mysnippets']

function! s:go_guru_scope_from_git_root()
  let gitroot = system("git rev-parse --show-toplevel | tr -d '\n'")
  let pattern = escape(go#util#gopath() . "/src/", '\ /')
  return substitute(gitroot, pattern, "", "") . "/... -vendor/"
endfunction

au FileType go silent exe "GoGuruScope " . s:go_guru_scope_from_git_root()

" fugitive
"" from right side
nmap <leader>gl :diffget //3<CR>
"" from left side
nmap <leader>gh :diffget //2<CR>

" }}}
