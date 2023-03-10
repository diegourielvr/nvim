return {
  -- Better `vim.notify()`
	"rcarriga/nvim-notify",
	keys = {
		{
		"<leader>un",
		function()
		  require("notify").dismiss({ silent = true, pending = true })
		end,
		desc = "Delete all Notifications",
		},
	},
	opts = {
		timeout = 2000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		render = "default", -- "compact, minimal, simple, default"
		stages = "fade_in_slide_out", -- "slide", "fade", "static", "fade_in_slide_out"
	},
	init = function()
		local notify = require("notify")
		-- this for transparency
		notify.setup({ background_colour = "#000000" })
		-- this overwrites the vim notify function
		vim.notify = notify.notify
	end,
}
