return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
		-- calling `setup` is optional for customization
		-- require("fzf-lua").setup({})
	-- end,

	-- https://github.com/ibhagwan/fzf-lua/blob/main/OPTIONS.md#buffers-and-files
	keys = {
		-- Pickers
		{ "<leader>FE", ":FzfLua files<CR>", silent = true, desc = "Fzf files" },
		{ "<leader>fzt", ":FzfLua tabs<CR>", silent = true, desc = "Fzf Open buffers in tabs" },
		{ "<leader>fzbl", ":FzfLua bufferlines<CR>", silent = true, desc = "Fzf open buffers lines" },
		-- { "<leader>fzb", ":FzfLua buffers<CR>", silent = true, desc = "Fzf open buffers" },
		-- { "<leader>fzof", ":FzfLua oldfiles<CR>", silent = true, desc = "Fzf File history" },

		-- Git
		{ "<leader>fg", ":FzfLua git_files<CR>", silent = true, desc = "Fzf Git files" },
		{ "<leader>fzgm", ":FzfLua git_commits<CR>", silent = true, desc = "Fzf Git commits" },
		{ "<leader>fzgs", ":FzfLua git_status<CR>", silent = true, desc = "Fzf Git status" },
		{ "<leader>fzgb", ":FzfLua git_branches<CR>", silent = true, desc = "Fzf Git branches" },

		-- LSP

		-- MISC
		{ "<leader>fzbi", ":FzfLua builtin<CR>", silent = true, desc = "Fzf built-in" },
		{ "<leader>ss", ":FzfLua spell_suggest<CR>", silent = true, desc = "Fzf spell suggest" },
	}
}
