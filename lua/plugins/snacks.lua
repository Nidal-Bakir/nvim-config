return {
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			image = {},
			input = {},
			quickfile = {},
			scroll = {},
			terminal = {
				auto_close = true,
				win = {
					style = "terminal",
					position = "bottom",
					height = 0.3,
					border = "rounded",
				},
				interactive = true,
			},
		},

		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			-- {
			-- 	"<leader>S",
			-- 	function()
			-- 		Snacks.scratch.select()
			-- 	end,
			-- 	desc = "Select Scratch Buffer",
			-- },
			{
				"<leader>tt",
				function()
					require("snacks").terminal.toggle()
				end,
				desc = "Toggle terminal",
			},
			{
				"<leader>td",
				function()
					require("snacks").terminal.toggle("docker")
				end,
				desc = "Docker terminal",
			},
			{
				"<leader>tf",
				function()
					require("snacks").terminal.focus()
				end,
				desc = "Focus terminal",
			},
		},
	},
}
