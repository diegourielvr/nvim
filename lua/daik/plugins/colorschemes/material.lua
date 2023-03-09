return {
	"marko-cerovac/material.nvim",
	config = function()
		require('material.functions').change_style("deep ocean")
		vim.cmd "colorscheme material"
	end
}
