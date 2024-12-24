local hiT = {
	Normal = "NONE",
	NormalFloat = "NONE", -- like hover window
	FloatBorder = "NONE", -- like hover border
	NormalSB = "NONE",
	BufferlineFill = "NONE",
	SignColumn = "NONE",
	StatusLine = "NONE",
	TroubleNormal = "NONE",
	LazyNormal = "NONE",
	--nvimtree
	NvimTreeNormal = "NONE",
	NvimTreeNormalNC = "NONE",
	--lualine
	lualine_c_normal = "NONE",
	-- Barbar
	BufferTabpageFill = "NONE",
	BufferDefaultTabpageFill = "NONE",
	BufferInactive = "NONE", -- buffers abiertos pero sin visualizar
	BufferInactiveSign = "NONE", -- buffers abiertos pero sin visualizar
	BufferInactiveMod = "NONE",
	-- BufferCurrentSign = "#063642", -- symbol bg |
	-- BufferCurrent = "#063642" -- current buffer tab,
	-- BufferCurrentMod = "#063642",
	--telescope
	TelescopeNormal = "NONE",
	TelescopeBorder = "NONE",
	--lspsaga
	SagaNormal = "NONE",
	SagaBorder = "NONE",
}

function TransparentScheme()
	for key, value in pairs(hiT) do
		vim.cmd(string.format("hi %s guibg=%s", key, value))
	end
	vim.cmd("hi BufferCurrentSign guifg='#278BD2'")
	print("Loading transparent...")
end

local hiD = {
	lualine_c_normal = "NONE",
	lualine_c_insert = "NONE",
	lualine_c_visual = "NONE",
	lualine_c_replace = "NONE",
	lualine_c_command = "NONE",
	lualine_c_inactive = "NONE",
}

function DefaultScheme()
	vim.cmd("colorscheme default")
	for key, value in pairs(hiD) do
		vim.cmd(string.format("hi %s guibg=%s", key, value))
	end
	-- vim.cmd("hi BufferCurrentSign guifg='#278BD2'")
	--lualine
	print("Loading default...")
end
