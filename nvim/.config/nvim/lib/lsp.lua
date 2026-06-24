vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "rounded",
		max_width = 80,
		max_height = 24,
	})
end, { desc = "LSP Hover" })

vim.keymap.set("n", "<leader>sh", function()
	vim.lsp.buf.signature_help({
		border = "rounded",
		max_width = 80,
		max_height = 25,
	})
end, { desc = "Signature Help" })
