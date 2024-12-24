return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = false,
	opts = {
		enabled = true,
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = false,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	}
}
