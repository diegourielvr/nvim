local hiT = {
	Normal = "NONE",
	NormalFloat = "NONE", -- like hover window
	NormalSB = "NONE",
	NormalNC = "None", -- ventanas alternas

	WinSeparator = "None",

	FloatBorder = "NONE", -- like hover border
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
	-- cursor
	cursorLineNr = "None",
	LineNr = "None",
	-- Barbar
	BufferCurrent = "None",
	BufferDefaultCurrent = "None",  -- current buffer tab,
	BufferDefaultCurrentIcon = "None", -- current buffer icon,
	BufferDefaultCurrentMod = "None",
	BufferCurrentSign = "None",     -- current buffer tab,
	BufferDefaultCurrentSign = "None", -- symbol bg |

	BufferInactive = "NONE",        -- buffers abiertos pero sin visualizar
	BufferInactiveSign = "NONE",    -- buffers abiertos pero sin visualizar
	BufferInactiveMod = "NONE",

	BufferVisible = "None",
	BufferVisibleIcon = "None",
	BufferVisibleSign = "None",

	BufferOffset = "None",
	BufferDefaultOffset = "None",

	BufferTabpageFill = "NONE",
	BufferDefaultTabpageFill = "NONE",

	--telescope
	TelescopeNormal = "NONE",
	TelescopeBorder = "NONE",
	--lspsaga
	SagaNormal = "NONE",
	SagaBorder = "NONE",
	--
	-- barbecue
	barbecue_normal = "None",
	barbecue_context = "None",
	barbecue_dirname = "None",
	barbecue_basename = "None",
	barbecue_separator = "None",
	barbecue_fileicon_Lua = "None",
	barbecue_ellipsis = "None",
	barbecue_modified = "None",
	barbecue_context_file = "None",
	barbecue_context_module = "None",
	barbecue_context_namespace = "None",
	barbecue_context_package = "None",
	barbecue_context_class = "None",
	barbecue_context_method = "None",
	barbecue_context_property = "None",
	barbecue_context_field = "None",
	barbecue_context_constructor = "None",
	barbecue_context_enum = "None",
	barbecue_context_interface = "None",
	barbecue_context_function = "None",
	barbecue_context_variable = "None",
	barbecue_context_constant = "None",
	barbecue_context_string = "None",
	barbecue_context_number = "None",
	barbecue_context_boolean = "None",
	barbecue_context_array = "None",
	barbecue_context_object = "None",
	barbecue_context_key = "None",
	barbecue_context_null = "None",
	barbecue_context_enum_member = "None",
	barbecue_context_struct = "None",
	barbecue_context_event = "None",
	barbecue_context_operator = "None",
	barbecue_context_type_parameter = "None",
}

function TransparentScheme()
	for key, value in pairs(hiT) do
		vim.cmd(string.format("hi %s guibg=%s", key, value))
	end
	vim.cmd("hi BufferCurrentSign guifg='#278BD2'")

	-- optional
	-- vim.cmd("hi barbecue_dirname guifg='#f5f5f5'")
	-- vim.cmd("hi barbecue_separator guifg='#f5f5f5'")
	-- vim.cmd("hi barbecue_elipsis guifg='#f5f5f5'")
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
