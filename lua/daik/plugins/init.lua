return {
	{ import = "daik.plugins.git"},
	{ import = "daik.plugins.ui"},
	{ import = "daik.plugins.editor"},
	{ import = "daik.plugins.mini"},
	-- Es necesario colocar en el siguiente orden los plugins de mson y lspconfig
	{ import = "daik.plugins.lsp.mason"}, -- (1)
	{ import = "daik.plugins.lsp.lsp"}, -- (2)
	{ import = "daik.plugins.lsp.null-ls"},
	{ import = "daik.plugins.lsp.lspsaga"},
	{ import = "daik.plugins.lsp.lsp_signature"},
	-- "kevinhwang91/nvim-ufo"
}
