vim.opt.number = true
vim.opt.cursorline= true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 8 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- keep 10 lines to left/right of cursor

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = true -- do auto-save

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})

