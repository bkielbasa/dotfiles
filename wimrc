set path=$PWD/**
syntax on

set number relativenumber
set shellcmdflag=-ic
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

command! -nargs=1 Rename try | saveas <args> | call delete(expand('#')) | bd # | endtry

if executable('fzf')
	nnoremap <silent> <S-f> :FZF<cr>
end

