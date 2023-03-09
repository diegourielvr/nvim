return {
	{ import = "daik.plugins.git"},
	{ import = "daik.plugins.ui"},
	-- Es necesario colocar en el siguiente orden los plugins de mson y lspconfig
	{ import = "daik.plugins.lsp.mason"}, -- (1)
	{ import = "daik.plugins.lsp.lsp"}, -- (2)
	{ import = "daik.plugins.lsp.null-ls"},
	{
		"echasnovski/mini.pairs", -- Autocompletar llaves {} '' "" [] 
		event = "VeryLazy",
		config = function(_, opts)
		  require("mini.pairs").setup(opts)
		end,
	},
}
