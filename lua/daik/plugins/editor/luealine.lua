return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local MODES = {
			-- BUFFERS = colors.teal,
			['i'] = { 'INSERT', "#81ffc6" }, -- Insert (INSERT)
			['n'] = { 'NORMAL' }, -- Normal (NORMAL)
			['v'] = { 'VISUAL', "#ffcc00" }, -- Visual (VISUAL)
			['R'] = { 'Replace', "#FF8989" }, -- Replace
			['c'] = { 'command-line' },   -- command-line
			['ce'] = { 'NORMAL EX' },
			['cv'] = { 'EX' },
			['ic'] = { 'INS-COMPLETE' },
			['no'] = { 'OPERATOR-PENDING' }, -- d, y, c
			['r'] = { 'HIT-ENTER', },
			['r?'] = { ':CONFIRM' },
			['rm'] = { '--MORE' },
			['Rv'] = { 'VIRTUAL' }, -- gR virtual
			['s'] = { 'SELECT' }, --gh select
			['S'] = { 'SELECT LINE' }, --gH
			['␓'] = { 'SELECT BLOCK' },
			['t'] = { 'TERMINAL' },
			['V'] = { 'VISUAL LINE' }, -- Visual Line (VISUAL-LINE)
			['␖'] = { 'VISUAL BLOCK' },
			['!'] = { 'SHELL' },
		}

		local modes = {
			function()
				return vim.g.libmodalActiveModeName or MODES[vim.api.nvim_get_mode().mode][1]
			end,
			icon = { "", align = "left" },
			separator = { left = "", right = "" },
			color = { fg = "#f5f5f5", bg = "NONE" },
			-- color = function()
			-- 	-- return { bg = "NONE", fg = "#f5f5f5" }
			-- 	return { bg = MODES[vim.g.libmodalActiveModeName] or MODES[vim.api.nvim_get_mode().mode][2], fg = "#252525" }
			-- end,
		}

		local branch = {
			"branch",
			icon = "",
			color = { fg = "#FE8443", bg = "NONE" },
			padding = 1, -- espacio a los lados
		}

		local diff = {
			"diff",
			colored = true,
			diff_color = {
				-- Same color values as the general color option can be used here.
				added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
				modified = 'LuaLineDiffChange', -- Changes the diff's modified color
				removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
			},
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
			color = { bg = "NONE" },
		}

		local filetype_icon = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { bg = "NONE" },
		}

		local filename = {
			"filename",
			file_status = false, -- mostrar estado del archivo
			path = 1,   -- 0: just filename, 1: relative path, 2: absolute path, 3
			color = { fg = "#f5f5f5", bg = "NONE" },
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = {
				"error",
				"warn",
				"hint",
				"info"
			},
			symbols = {
				error = " ",
				warn  = " ",
				hint  = "󰌶 ",
				info  = " ",
			},
			colored = true,
			always_visible = false,
			update_in_insert = false, -- Update diagnostics in insert mode.
			color = { bg = "NONE" }
		}

		local lsp = function ()
			local clients = vim.lsp.get_active_clients{bufnr=0}

			if #clients == 0 then
				return "󰅩 󰒲 "
			end

			local clients_name = {}

			for _, client in pairs(clients) do
				table.insert(clients_name,client.name)
			end

			local language_servers = "󰅩 " .. table.concat(clients_name, ", ")

			return language_servers
		end

		local encoding = {
			"encoding",
			color = { fg = "#f5f5f5", bg = "NONE" }
		}

		local so = {
			'fileformat',
			symbols = {
				unix = '', -- e712
				dos = '', -- e70f
				mac = '', -- e711
			},
			color = { fg = "#f6f6f6", bg = "NONE" }
		}

		local indent = {
			function()
				return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
			end,
			icon = { "󱇂", align = "left" },
			color = { fg = "#f6f6f6", bg = "NONE" }
		}

		local progress = {
			"progress",
			icon = { "", align = "left" },
			color = { fg = "#f5f5f5", bg = "NONE" },
		}

		local location = {
			"location",
			color = { fg = "#f5f5f5", bg = "NONE" }
		}

		local datetime = {
			'datetime',
			icon = { " " },
			style = "%R",
			separator = { left = "", right = " " },
		}

		local custom_theme = {
			normal = {
				a = { bg = "None" },
				b = { bg = "None" },
				c = { bg = "None" },
			},
		}

		require('lualine').setup {
			options = {
				theme = custom_theme, -- 'auto'
				icons_enabled = true,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					"dashboard", "nvim-tree", "alpha"
				},
				always_divide_middle = true,
				globalstatus = true, -- tener solo una linea de estado
			},
			sections = {
				lualine_a = {
					modes,
				},
				lualine_b = {
					branch,
					diff,
				},
				lualine_c = {
					-- filetype_icon,
					-- filename,
				},
				lualine_x = {
					diagnostics,
					{
						-- lsp_progess,
						lsp,
						color = { fg = "#75e9e5", bg = "NONE" },
					},
				},
				lualine_y = {
					location,
					progress,
					indent,
				},
				lualine_z = {
					encoding,
					filetype_icon,
					-- so,
					-- datetime,
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			extensions = {}
		}
	end
}
