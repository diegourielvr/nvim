return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	opts = {
		theme = 'doom', --  'doom' | 'hyper'
		hide = {
			statusline = true, -- hide statusline default is true
			tabline = true, -- hide the tabline
			winbar =true, -- hide winbar
		},
		config = {
			header = {
				"                            ",
				"                            ",
				"                            ",
				"██████╗ ██╗  ██╗ ██╗██╗  ██╗",
				"██╔══██╗██║  ██║███║██║ ██╔╝",
				"██║  ██║███████║╚██║█████╔╝ ",
				"██║  ██║╚════██║ ██║██╔═██╗ ",
				"██████╔╝     ██║ ██║██║  ██╗",
				"╚═════╝      ╚═╝ ╚═╝╚═╝  ╚═╝",
				"                            ",
			},
			center = {
				{ action = ":Telescope find_files", desc = " Find files", icon = " ", key = "f" },
				{ action = ":Telescope oldfiles",	desc = " Recent files          ", icon = " ", key = "r" },
				{ action = ":Telescope live_grep",	desc = " Find text             ", icon = " ", key = "g" },
				{ action = ":e $MYVIMRC",			desc = " Config                ", icon = " ", key = "c" },
				{ action = ":Lazy",					desc = " Lazy                  ", icon = "󰒲 ", key = "l" },
				{ action = ":qa",					desc = " Quit                  ", icon = " ", key = "q" },
			},
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
			end,
		}
	}
}

