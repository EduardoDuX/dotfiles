return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { auto_install = true },
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lista de servidores que você quer ativar
			local servers = { "lua_ls", "bashls", "clangd", "rust_analyzer", "pyright" }

			for _, server in ipairs(servers) do
				-- Configura as capabilities padrão (e outras opções se precisar) para cada servidor
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				-- Habilita o servidor nativamente
				vim.lsp.enable(server)
			end

			-- Atalhos globais ou via LspAttach (mantidos conforme o seu fluxo)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
