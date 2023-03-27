return { 'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	config = function()
		local MODES = {
			-- BUFFERS = colors.teal,
			['i'] = { '    ', "#42D0FF" }, -- Insert (INSERT)
			['n'] = { '    ', "#81FFC6" }, -- Normal (NORMAL)
			['v'] = { '    ', "#EE81FF" }, -- Visual (VISUAL)
			['R'] = { '    ', "#FF8989" }, -- Replace
			['c'] = { '󰚈󰚈󰚈󰚈', "#ffcc00" }, -- command-line
			['ce'] = { 'NORMAL EX', "#ffcc00" },
			['cv'] = { 'EX', "#ffcc00" },
			['ic'] = { 'INS-COMPLETE', "#ffcc00" },
			['no'] = { 'OPERATOR-PENDING', "#ffcc00" }, -- d, y, c
			['r'] = { 'HIT-ENTER', "#ffcc00" },
			['r?'] = { ':CONFIRM', "#ffcc00" },
			['rm'] = { '--MORE', "#ffcc00" },
			['Rv'] = { '󰚈󰚈󰚈󰚈', "#ffcc00" }, -- gR virtual
			['s'] = { '󰚈󰚈󰚈󰚈', "#ffcc00" }, --gh select
			['S'] = { 'SELECT LINE', "#ffcc00" }, --gH
			['␓'] = { 'SELECT BLOCK', "#ffcc00" },
			['t'] = { 'TERMINAL', "#ffcc00" },
			['V'] = { 'VISUAL LINE', "#ffcc00" }, -- Visual Line (VISUAL-LINE)
			['␖'] = { 'VISUAL BLOCK', "#ffcc00" },
			['!'] = { 'SHELL', "#ffcc00" },
		}

		local custom_icons = {
			function()
				return ""
			end,
			separator = { left = "", right = " " },
		}

		local modes = {
			-- "mode",
			function()
				return vim.g.libmodalActiveModeName or MODES[vim.api.nvim_get_mode().mode][1]
			end,
			separator = { left = "", right = " " },
			-- color = function()
			-- 	return { fg = MODES[vim.g.libmodalActiveModeName] or MODES[vim.api.nvim_get_mode().mode][2], bg = "NONE" }
			-- end,
		}

		local filetype_icon = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { bg = "NONE" },
		}

		local filename = {
			"filename",
			file_status = false,
			path = 1, -- 0: just filename, 1: relative path, 2: absolute path, 3
			color = { bg = "NONE" },
			-- symbols = {
			-- 	modified = '󰚀',
			-- }
		}

		local filestatus = {
			function ()
				if vim.bo.modified then
					return "󰸊"
				else
					return "󰖌"
				end
			end,
			color = { fg = "#00ffcc", bg = "NONE" },
		}

		local branch = {
			"branch",
			icon = "",
			color = {fg = "#8FCDA9", bg="NONE"},
			-- color = {bg = "#8FCDA9", fg = "#121319"},
			-- separator = { left = "", right = "" },
  			padding = 1, -- espacio a los lados
		}

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
			color = {bg="NONE"},
			-- separator = { left = "", right = "" },
		}

		local fun = {
			function()
				return ""
			end,
			color = { bg = "#F1FFC4", fg = "#121319" },
			separator = { left = "", right = "" },
		}

		local spaces = {
			function()
				return " "
			end,
			padding = -1, -- padding = -1
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = {
				"error",
				"warn",
				"hint",
			},
			symbols = {
				error = " ",
				warn = " ",
				hint = " ",
				info = " ",
			},
			colored = true,
			always_visible = false,
			color = { bg = "NONE"}
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
			color = { bg = "none" }
			-- color = { bg = "#2b1c2f", fg = "#121319" },
		}

		local os = {
			'fileformat',
			color = { fg = "#8BC6FC", bg = "NONE" },
			-- color = { bg = "#8BC6FC", fg = "#121319" },
		}

		local encoding = {
			"encoding",
		}

		local indent_icon = {
			function()
				return ""
			end,
			color = { fg = "#ECD3A0", bg = "NONE" },
		}

		local indent = function()
			return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end

		local location_icon = {
			function()
				return ""
			end,
			-- color = { bg = "#85A1F2", fg = "#000000" },
			-- color = { bg = "#FD7C6E", fg = "#121319" },
			color = { fg = "#FD7C6E", bg = "NONE" },
			padding = 0.1,
		}

		local progress = {
			"progress",
		}

		local location = {
			"location",
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local lsp_progess = function()
			msg = msg or "LS Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "LS Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			-- local copilot_active = false
			local null_ls = require("null-ls")
			local alternative_methods = {
				null_ls.methods.DIAGNOSTICS,
				null_ls.methods.DIAGNOSTICS_ON_OPEN,
				null_ls.methods.DIAGNOSTICS_ON_SAVE,
			}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				-- if client.name == "copilot" then
				-- 	copilot_active = true
				-- end
			end

			function list_registered_providers_names(filetype)
				local s = require("null-ls.sources")
				local available_sources = s.get_available(filetype)
				local registered = {}
				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end
				return registered
			end
			function list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
					return registered_providers[m] or {}
				end, alternative_methods))
				return providers_for_methods
			end

			function formatters_list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				return registered_providers[null_ls.methods.FORMATTING] or {}
			end
			-- formatters
			local supported_formatters = formatters_list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			-- linters
			local supported_linters = list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)
			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = "󰅩 " .. table.concat(unique_client_names, ", ") .. ""
			-- local language_servers = " " .. table.concat(unique_client_names, ", ") .. ""

			-- if copilot_active then
			-- 	language_servers = language_servers .. "%#SLCopilot#" .. ""
			-- end

			return language_servers
		end

		-- local win = {
		-- 	function ()
		-- 		return "%{%v:lua.require'nvim-navic'.get_location()%}"
		-- 	end,
		-- }

		require('lualine').setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto", -- "auto""
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "packer", "neo-tree" },
				always_divide_middle = true,
			},
			--Componentes disponibles
			-- https://github.com/nvim-lualine/lualine.nvim#available-components
			sections = {
				lualine_a = {
					custom_icons,
					modes,
				},
				lualine_b = { --test
				},
				lualine_c = {
					filetype_icon,
					filename,
					filestatus,
					branch,
					diff,
					-- fun,
				},

				lualine_x = {
					diagnostics,
					{
						lsp_progess,
						color = {fg = "#75e9e5", bg = "NONE"},
					},
					filetype,
					os,
					encoding,
					indent_icon,
					indent,
					location_icon,
					progress,
					location,
				},
				lualine_y = {},
				lualine_z = {},
			},
			-- winbar = {
			--   	lualine_a = {},
			--   	lualine_b = {
			-- 		{
			-- 			'filename',
			-- 			path = 1, -- 0: just filename, 1: relative path, 2: absolute path, 3
			-- 		}
			-- 	},
			--   	lualine_c = {
			-- 		win,
			-- 	},
			--   	lualine_x = {},
			--   	lualine_y = {},
			--   	lualine_z = {}
			-- },

			-- tabline = {
			-- 	lualine_a = {'filename'},
			-- 	lualine_b = {},
			-- 	lualine_c = {},
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {'fileformat'}
			-- },
		})

		vim.cmd "highlight! link StatusLine Normal"
		-- vim.cmd "highlight! link StatusLineNC Normal"
		vim.cmd "highlight lualine_c_normal guibg='NONE'"
		vim.cmd "highlight lualine_c_visual guibg='NONE'"
		vim.cmd "highlight lualine_c_insert guibg='NONE'"
		vim.cmd "highlight lualine_c_command guibg='NONE'"
		vim.cmd "highlight lualine_c_inactive guibg='NONE'"
		vim.cmd "highlight lualine_c_replace guibg='NONE'"
	end
}

