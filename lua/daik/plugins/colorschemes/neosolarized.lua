return {
	"svrana/neosolarized.nvim",
	dependencies = {
		{ "tjdevries/colorbuddy.nvim" },
	},
	priority = 1000,
	config = function()
		require('neosolarized').setup({})

		vim.cmd "hi CursorLineNr guifg=#ffcc00"
		vim.cmd('colorscheme neosolarized')
	end
}
