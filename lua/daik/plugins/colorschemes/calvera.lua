return {
	"hoprr/calvera-dark.nvim",
	config = function()
		vim.cmd "colorscheme calvera"
		vim.cmd "hi String gui=none" -- String style normal (no italic)
	end
}
