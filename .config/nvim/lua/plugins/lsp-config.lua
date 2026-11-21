return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = { auto_install = true },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = { "lua_ls", "bashls", "clangd", "rust_analyzer", "pyright" }

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

			vim.diagnostic.config({
				-- Mostra a mensagem do warning/erro na própria linha do código
				virtual_text = {
					prefix = "●",
					spacing = 4,
				},
				-- Mantém o W / E / I / H na coluna lateral (sign column)
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "E",
						[vim.diagnostic.severity.WARN] = "W",
						[vim.diagnostic.severity.INFO] = "I",
						[vim.diagnostic.severity.HINT] = "H",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
