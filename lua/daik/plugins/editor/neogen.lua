return {
	"danymat/neogen",
	-- dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		enabled = true,
	},
	keys = {
		{ "<leader>gen", ":Neogen<CR>", silent = true },
	}
}
