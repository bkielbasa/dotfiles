vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- relative line numbers
-- :
vim.cmd [[
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]]

-- add a new line before/after the current line
vim.cmd [[
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
]]

vim.cmd [[
" Use vim, not vi api
set nocompatible

filetype plugin on

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
set shiftwidth=4

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

" enable syntax based folding
set foldmethod=syntax
set foldlevel=10
]]

--- harpoon
vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>H', [[<cmd>lua require('harpoon.mark').add_file()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', [[<cmd>lua require('harpoon.ui').nav_next()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', [[<cmd>lua require('harpoon.ui').nav_prev()<CR>]], { noremap = true, silent = true })

