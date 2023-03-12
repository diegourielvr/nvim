return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				cursorline = true, -- Use cursorline highlighting?
				transparency = false, -- Use a transparent background?
				terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
				highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
			},
		})
		-- vim.cmd("colorscheme onedark")
		-- vim.cmd("colorscheme onelight")
		vim.cmd("colorscheme onedark_vivid")
		-- vim.cmd("colorscheme onedark_dark")
	end,
}
