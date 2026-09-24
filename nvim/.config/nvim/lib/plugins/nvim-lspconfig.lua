-- global servers to install
-- yaml-language-server
-- ocaml-lsp, not ocaml-language-server
-- pyright
-- solargraph
-- gopls
-- elixir-ls
-- tsserver (typescript-language-server)
-- rust_analyzer
-- vscode-langservers-extracted
-- clangd

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local util = require("lspconfig/util")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		vim.lsp.config("yamlls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "yamlls" })

		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "cssls" })

		vim.lsp.config("dockerls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "dockerls" })

		vim.lsp.config("graphql", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "graphql" })

		vim.lsp.config("html", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "html" })

		vim.lsp.config("jsonls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "jsonls" })

		vim.lsp.config("ruby_lsp", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "ruby_lsp" })

		vim.lsp.config("sqlls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "sqlls" })

		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "pyright" })

		vim.lsp.config("hls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "hls" })

		vim.lsp.config("ocamllsp", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "ocamllsp" })

		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "clangd" })

		vim.lsp.config("gopls", {
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})
		vim.lsp.enable({ "gopls" })

		-- have to tell nvim where elixirls is located, not stored in project by default
		-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
		vim.lsp.config("elixirls", {
			cmd = { "/opt/homebrew/bin/elixir-ls" },
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
		vim.lsp.enable({ "elixirls" })

		local buf_map = function(bufnr, mode, lhs, rhs, opts)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
				silent = true,
			})
		end

		vim.lsp.config("tsc", {
      capabilities = capabilities
		})
		vim.lsp.enable("tsc")

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "rust_analyzer" })

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.enable({ "lua_ls" })

		vim.lsp.config("teal_ls", {
			capabilities = capabilities,
			-- on_attach = function(client)
			-- 	client.server_capabilities.semanticTokensProvider = nil
			-- end,
		})
		vim.lsp.enable({ "teal_ls" })

		vim.lsp.config("prismals", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "prismals" })

		vim.lsp.config("kotlin_lsp", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "kotlin_lsp" })

		vim.lsp.config("zls", {
			capabilities = capabilities,
		})
		vim.lsp.enable({ "zls" })

		vim.lsp.config("metals", { capabilities = capabilities })
		vim.lsp.enable({ "metals" })

		vim.lsp.config("clojure_lsp", { capabilities = capabilities })
		vim.lsp.enable({ "clojure_lsp" })
	end,
}
