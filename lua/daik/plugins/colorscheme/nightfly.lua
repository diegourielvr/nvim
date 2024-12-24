return { 
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
		-- Lua initialization file
		vim.g.nightflyCursorColor = true
		-- Lua initialization file
		vim.g.nightflyItalics = false
		-- Lua initialization file
		vim.g.nightflyNormalFloat = true
		-- Lua initialization file
		vim.g.nightflyVirtualTextColor = true

		vim.cmd("colorscheme nightfly")
	end
}
