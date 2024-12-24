return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		views = { -- config for views
			confirm = {
				border = {
					style = "rounded",
					text = {
						top = " 󰩌 Confirm ",
					},
				},
			},
		},
		-- NoiceConfig
		cmdline = {
			enabled = true, -- habilita cmdline ui
			view = "cmdline_popup", -- cmdline_popup or cmdline for classic
			-- Configuración del backend: cmdline_popup
			opts = { -- backend = popup -> ofrecida por nui.nvim. Config for nui popup https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
				border = {
					-- style = "rounded",
					text = {
						top = " Cmdline",
						top_align = "left",
						-- bottom = "󱚝 ",
						-- bottom_align = "right",
					}
				}
			},
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			}
		},
		messages = {
			-- confirm
			 -- show messages with :messages
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			iew_error = "notify", -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
		presets = {
			long_message_to_split = false, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		commands = { -- comandos disponibles con :Noice command
			history = { -- :Noice history
				view = "popup",
			}
		}
	},
	keys = {
		-- { "<leader>sh", ":Noice history<CR>", mode="n", silent=true },
		-- { "<leader>sc", ":Noice config <CR>", mode="n", silent=true },
	}
}
