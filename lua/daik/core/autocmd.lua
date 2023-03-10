vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = {
			"Normal",
			"NormalFloat",
			"SignColumn",
			-- "NormalNC",
			-- "TelescopeBorder",
			"NvimTreeNormal",
			-- "EndOfBuffer",
			"MsgArea",
		}
		for _, name in ipairs(hl_groups) do
			vim.cmd(string.format("highlight %s ctermbg=none guibg=NONE", name))
		end
	end,
})
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", gui="underline")
-- vim.api.nvim_set_hl(0, "Normal", {bg=NONE})
-- vim.cmd ("hi Normal guibg=NONE") -- Ventanas normal transparente
--
-- vim.api.nvim_set_hl(0, "Normal", {bg="NONE"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg="none"})
-- vim.api.nvim_set_hl(0, "StatusLine", {bg="none"})
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", {bg="none"})
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", {bg="none"})
