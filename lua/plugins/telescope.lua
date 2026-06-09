return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-frecency.nvim",
	},
	config = function()
		require("telescope").setup({
			pickers = {
				buffers = {
					disable_coordinates = true,
					show_all_buffers = true,
					only_cwd = true,
					sort_mru = true,
					ignore_current_buffer = true,
				},
			},
			defaults = {
				path_display = {
					filename_first = {
						reverse_directories = false, -- Set to true if you want subdirectories to go before parent directories
					},
				},
			},
			extensions = {
				frecency = {
					show_scores = false,
					workspace = "CWD",
					show_filter_column = false,
					-- matcher = "fuzzy",
					path_display = {
						filename_first = {
							reverse_directories = false, -- Set to true if you want subdirectories to go before parent directories
						},
					},
				},
			},
		})
		local builtin = require("telescope.builtin")
		-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope frecency workspace=CWD theme=ivy<CR>",
			{ desc = "Telescope find files" }
		)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
