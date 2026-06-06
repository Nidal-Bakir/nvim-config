vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.opt.shiftwidth = 4 -- indent width

vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 8 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- keep 10 lines to left/right of cursor

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = true -- do auto-save

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" then
			vim.cmd("silent! write")
		end
	end,
})

vim.opt.showmatch = true -- highlights matching brackets
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.cmdheight = 0
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 15 -- floating window transparency
vim.opt.concealcursor = ""
vim.opt.conceallevel = 2
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = false -- do not create an undo file
vim.opt.errorbells = false
vim.opt.hidden = true -- allow hidden buffers
vim.opt.backspace = "indent,eol,start" -- better backspace behavior
vim.opt.autochdir = false -- do not auto change directories
vim.opt.path:append("**") -- include subdirs in search

vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.diffopt:append("linematch:60") -- improve diff display

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

vim.keymap.set("n", "<leader>bs", function()
	-- Open a new horizontal split
	vim.cmd("new")

	-- Set local options to make it a temporary scratchpad
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
	vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
	vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
end, { desc = "Open a temporary scratch buffer" })
