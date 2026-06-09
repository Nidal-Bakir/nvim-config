return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
			progress = {
				enabled = true,
			},
			signature = {
				enabled = true,
			},
		},
		presets = {
			command_palette = true,
			long_message_to_split = true,
			bottom_search = false,
			lsp_doc_border = false,
		},
	},
}
