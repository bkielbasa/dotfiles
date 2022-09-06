vim.cmd [[
let g:neoformat_try_node_exe = 1
autocmd TextChanged,InsertLeave *.jsx,*.js,*.ts,*.tsx Neoformat
]]

