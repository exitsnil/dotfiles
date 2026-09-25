-- source entire lua file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- source current line of lua code
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- source selected lua code
vim.keymap.set("v", "<space>x", ":lua<CR>")
