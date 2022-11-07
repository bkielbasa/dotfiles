require('general')
require('plugins')
require('lsp')
require('diagnostics')
require('format')
require('theme')
require('statusline')
require('snippets')

-- add a new line before/after the current line
vim.cmd [[
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
]]

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

