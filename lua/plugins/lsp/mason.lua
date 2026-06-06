return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			})

			vim.lsp.config("harper_ls", {
				settings = {
					["harper-ls"] = {
						linters = {
							SentenceCapitalization = false,
						},
					},
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
				"gopls",
				"yamlls",
				"codebook",
				"isort",
				"kotlin_lsp",
				"lemminx",
				"nginx_language_server",
				"postgres_lsp",
				"pylint",
				"stylua",
				"systemd_lsp",
				"prettier",
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		},
	},
}
