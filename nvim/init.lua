require('general')
require('plugins')
require('format')
require('theme')
require('statusline')
require('snippets')

-- plugins configuration
vim.cmd [[
" Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" harpoon
nmap <leader>H :lua require("harpoon.mark").add_file()<CR>
nmap <leader>q :lua require("harpoon.ui").toggle_quick_menu()<CR>

" FZF
nnoremap <silent> <C-f> :FZF<cr>

" git
nmap <leader>C :Git commit<cr>
nmap <leader>p :Git push<cr>
nmap <leader>B :GBranches<cr>
]]

