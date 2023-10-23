function transparentScheme()
	vim.cmd "hi Normal guibg=NONE"
	vim.cmd "hi NormalFloat guibg=NONE"
	vim.cmd "hi SignColumn guibg=NONE"
	vim.cmd "hi StatusLine guibg=NONE"
	vim.cmd "hi NvimTreeNormal guibg=NONE"
	vim.cmd "hi LazyNormal guibg=NONE"
	vim.cmd "hi TelescopeNormal guibg=NONE"
	vim.cmd "hi TelescopeBorder guibg=NONE"
	vim.cmd "hi SagaNormal guibg=NONE"
	vim.cmd "hi SagaBorder guibg=NONE"
	vim.cmd "hi NormalSB guibg=NONE"
	vim.cmd "hi TroubleNormal guibg=NONE"
	-- Winbar
	vim.cmd "hi WinBar guibg=NONE"

	-- Plugin Barbar
	vim.cmd "hi BufferTabpageFill guibg=NONE" -- Fondo de barra de buffers
	vim.cmd "hi BufferInactive guibg=NONE" -- Fondo de buffers inactivos
	vim.cmd "hi BufferInactiveSign guibg=NONE" -- Fondo de separador de buffers inactivos
	vim.cmd "hi BufferVisibleSign guibg=NONE" -- Fondo de separador de buffers visibles (ventanas verticales u horizontales)
	vim.cmd "hi BufferVisible guibg=NONE" -- Fondo de separador de buffers visibles (ventanas verticales u horizontales)

	-- Plugin bufferLine
	-- vim.cmd "hi BufferlineFill guibg=NONE"
	-- vim.cmd "hi BufferInactive guibg=NONE"

	-- vim.cmd "hi NvimTreeNormalNC guibg=NONE"
end

-- transparentScheme()
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		local hl_groups = {
-- 			"Normal",
-- 			"NormalFloat",
-- 			"SignColumn",
-- 			"NvimTreeNormal",
-- 			"TelescopeNormal",
-- 			"BufferLineFill",
-- 			-- "NormalNC",
-- 			-- "TelescopeBorder",
-- 			-- "EndOfBuffer",
-- 			"MsgArea",
-- 		}
-- 		for _, name in ipairs(hl_groups) do
-- 			vim.cmd(string.format("highlight %s ctermbg=none guibg=NONE", name))
-- 		end
-- 	end,
-- })
-- vim.api.nvim_set_hl(0, "Normal", {bg="NONE"})
-- Comando para activar transparencia <leader>T
