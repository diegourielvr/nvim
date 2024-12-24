return { -- settings: https://luals.github.io/wiki/settings/
	settings = {
		Lua = {
			-- Fix Undefined global 'vim'
			diagnostics = {
				globals = { "vim", "pairs" }, -- Variables declaradas como globales
			},
			telemetry = {
				enable = false,
			},
			completion = {
				callSnippet = "Both", -- "Disable", "Both", "Replace"
			},
			window = { -- https://luals.github.io/wiki/settings/#window
				progressBar = true, -- NOTE: Show a progress bar in the bottom status bar that shows how the workspace loading is progressing.
			},
			-- codeLens = {
			-- 	enable = true,
			-- },
			hint = {
				enable = true,
				arrayIndex = "Disable", --Enable, Auto, Disable
				await = true,
				paramName = "All",
				paramType = true,
				semicolon = "Disable",
				setType = false,
			},
			-- format = {
			-- 	enable = true,
			-- 	defaultConfig = {
			-- 		indent_style = "space",
			-- 		indent_size = "2",
			-- 	}
			-- },
		},
	},
}
