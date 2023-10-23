return {
	"nvim-tree/nvim-tree.lua", -- Explorador de archivos
	keys = {
		{ "<leader>E", ":NvimTreeToggle <CR>", desc = "Open or close the tree", mode = "n", silent = true },
		{ "<leader>EM", ":h nvim-tree-default-mappings <CR>", desc = "Open or close the tree", mode = "n", silent = true },
	},
	opts = {
		renderer = {
			root_folder_modifier = ":t",
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			width = 30,
			--height = 30,
			side = "left",
		},
	}
}
