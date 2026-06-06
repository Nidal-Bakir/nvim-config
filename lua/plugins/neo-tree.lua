return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/snacks.nvim",
		},

		keys = {
			{
				"<leader>e",
				"<Cmd>Neotree toggle<CR>",
				desc = "Toggle Neo-tree",
			},
		},

		opts = function(_, opts)
			local events = require("neo-tree.events")

			local function on_move(data)
				Snacks.rename.on_rename_file(data.source, data.destination)
			end

			opts.event_handlers = opts.event_handlers or {}

			vim.list_extend(opts.event_handlers, {
				{
					event = events.FILE_MOVED,
					handler = on_move,
				},
				{
					event = events.FILE_RENAMED,
					handler = on_move,
				},
			})

			opts.window = {
				position = "right",
			}

			opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
				hijack_netrw_behavior = "open_current",

				use_libuv_file_watcher = true,

				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},

				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			})
		end,
	},
	{
		"Crysthamus/nvim-file-operations",
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("nvim-file-operations").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
