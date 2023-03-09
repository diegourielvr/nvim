local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "daik.plugins" },
	},
	ui = {
		border = "rounded", -- ver valores en border: https://neovim.io/doc/user/api.html#nvim_open_win()
	}
})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy<CR>", opts)
