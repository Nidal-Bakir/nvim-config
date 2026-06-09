return {
	"olexsmir/gopher.nvim",
	ft = "go",
	branch = "develop",
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	opts = {},
}
