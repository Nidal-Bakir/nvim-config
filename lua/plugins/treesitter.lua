return {
    {
	"windwp/nvim-ts-autotag",
	config = function()
	require("nvim-ts-autotag").setup()
	end,
    },
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
	    require("nvim-treesitter").setup({
	    highlight = { enable = true },
	    indent = { enable = true },
	    autotag = { enable = true },
	  })
	  require('nvim-treesitter').install{ 
	       -- Core
		"lua",
		"vim",
		"vimdoc",
		"bash",

		-- Web
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx", "json", "yaml",

		-- Backend
		"go",
		"gomod",
		"gosum",
		"gowork",
		"sql",

		-- Flutter
		"dart",

		-- DevOps / infra
		"dockerfile", "gitignore",

		-- Config / misc
		"toml",
		"regex",
		"markdown",
		"markdown_inline",
	  }
	      vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
	end
    },
}
