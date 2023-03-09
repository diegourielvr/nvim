return {
    "SmiteshP/nvim-navic",
    -- lazy = true,

	config = function()
		require('nvim-navic').setup {
			highlight = true,
			depth_limit = 5,
			separator = " 󰬫 ",
			depth_limit_indicator = "...",
			safe_output = true
		}
	end,
  }
