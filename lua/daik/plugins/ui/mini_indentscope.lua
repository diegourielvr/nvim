return {
	"echasnovski/mini.indentscope",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = "BufEnter",
	opts = {
		symbol = "┃", -- "▏"
		options = {
			border = 'both', -- Can be one of: 'both', 'top', 'bottom', 'none'.
			indent_at_cursor = true, -- Useful to see incremental scopes with horizontal cursor movements.

			-- Whether to first check input line to be a border of adjacent scope.
			-- Use it if you want to place cursor on function header to get scope of
			-- its body.
			try_as_border = true
		},
		draw = {
			delay = 100, -- Delay (in ms) between event and start of drawing scope indicator
			priority = 2, -- Symbol priority. Increase to display on top of more symbols.
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", { -- Deshabilitar miniindentscope para los siguiente tipos de archivos
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"NvimTree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
