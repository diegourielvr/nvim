return {
	'uloco/bluloco.nvim',
	priority = 1000,
	dependencies = { 'rktjmp/lush.nvim' },
	config = function()
		require("bluloco").setup({
			style = "dark", -- auto | dark | light 
			-- transparent = true,
			guicursor = true,
		})
		vim.cmd('colorscheme bluloco')
	end,
}
