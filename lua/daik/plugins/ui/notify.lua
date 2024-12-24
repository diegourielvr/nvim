return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	keys = {
		{ "<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
		{ "<leader>sn", ":Telescope notify<CR>", mode="n", silent=true },
	},
	opts = {
		timeout = 1000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		render = "wrapped-compact", -- "compact", "minimal", "simple", "default", "wrapped-compact"
		stages = "fade", -- "slide", "fade", "static", "fade_in_slide_out"
		top_down = true,
		background_colour = "#121212",
	},
	init = function(_, opts)
		local notify = require("notify")
		-- this for transparency
		notify.setup(opts)
		-- this overwrites the vim notify function
		vim.notify = notify.notify
	end,
}
