return {
	settings = {
		Lua = {
			-- Fix Undefined global 'vim'
			diagnostics = {
				globals = { "vim", "pairs"},
			},
			telemetry = {
				enable = false,
			},
			-- workspace = {
			-- 	library = {
			-- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 		[vim.fn.stdpath("config") .. "/lua"] = true,
			-- 	},
			-- },
		},
	},
}
