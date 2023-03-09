return {
	settings = {
		Lua = {
			-- Fix Undefined global 'vim'
			diagnostics = {
				globals = { "vim", "pairs"},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
