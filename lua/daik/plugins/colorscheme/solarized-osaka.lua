local transparent = false-- true | false
local stylebg = "normal" -- 'transparent' | 'normal' | 'dark'

return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = transparent, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a terminal 
		styles = { -- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = false, bold = false},
			keywords = { italic = false},
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = stylebg, -- style for sidebars (split)
			floats = stylebg, -- style for floating windows (telescope, etc.)
		},
	},
	config = function(_, opts)
		require("solarized-osaka").setup(opts)
		vim.cmd("colorscheme solarized-osaka")
	end
}
