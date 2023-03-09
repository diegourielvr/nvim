return {
	"bluz71/vim-nightfly-colors",
	name = "nightfly",	--nombre del plugin
	priority = 1000,	-- valores altos solo para temas
	config = function()	-- configuración que es aplicada cuando se carga el plugin. A diferencia de "init" que se configura aunque no se cargue el plugin
		-- Lua initialization file
		-- vim.g.nightflyCursorColor = true 
		-- -- Lua initialization file
		-- vim.g.nightflyTransparent = true
		-- -- Lua initialization file
		-- vim.g.nightflyNormalFloat = true
		-- -- Lua initialization file
		-- vim.g.nightflyWinSeparator = 2 -- value = 0 or 2
		-- Lua initialization file
		-- vim.g.nightflyVirtualTextColor = true
		vim.cmd("colorscheme nightfly")
	end
}
