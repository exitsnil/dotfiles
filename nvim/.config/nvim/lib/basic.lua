vim.opt.modelines = 0
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.laststatus = 2
vim.opt.visualbell = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.signcolumn = "no"
vim.opt.nu = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme tokyonight-night")
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("highlight NormalFloat guibg=#1c1c1c")

-- primarily used for navigating through kernel source tree
vim.opt.tags = "./tags;,tags"
