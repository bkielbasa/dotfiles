set path=$PWD/**
syntax on

set directory=~/.vim/tmp/ "move swap files out of current dir
set clipboard=unnamedplus "System clipboard integration
set cursorline "underline current line
set noequalalways "splitting a window won't reduce the size of the current window

" Use ctrl-space to autocomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Netrw File explorer config 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <C-n> :Vexplore<CR>

set number relativenumber
set shellcmdflag=-ic
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set encoding=utf-8

call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" youcompleteme
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_warning_symbol = '>'
let g:ycm_show_diagnostics_ui = 1

augroup golang
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

command! -nargs=1 Rename try | saveas <args> | call delete(expand('#')) | bd # | endtry

if executable('fzf')
	nnoremap <silent> <S-f> :FZF<cr>
end

