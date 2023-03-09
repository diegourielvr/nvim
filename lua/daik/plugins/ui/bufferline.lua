return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			--buffer_close_icon = "",
			-- indicator = { -- Estilo de la pestaña
   --      		icon = '▎', -- this should be omitted if indicator style is not 'icon'
   --          	style = 'icon', -- icon, underline
			-- },
			separator_style = "thin", -- slant, slope, thin, thick  
			buffer_close_icon = '',
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = '',
            right_trunc_marker = '',
			max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 18,
			diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center", -- "left" | "center" | "right"
					separator = true,
				}
            },
			color_icons = true,
			show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            enforce_regular_tabs = true,
            always_show_bufferline = true,
			hover = {
                enabled = true,
                delay = 10,
                reveal = {'close'}
            },
        },
		-- highlights = {
  --   		fill = {
  --     			fg = { attribute = "fg", highlight = "#ff0000" },
  --     			--bg = { attribute = "bg", highlight = "TabLine" },
  --   		},
  --   		background = {
  --  				fg = { attribute = "fg", highlight = "TabLine" },
  --     			bg = { attribute = "bg", highlight = "TabLine" },
  --   		},
		-- 	-- buffer_selected = {
		-- 	--   guifg = {attribute='fg',highlight='#ff0000'},
		-- 	--   guibg = {attribute='bg',highlight='#0000ff'},
		-- 	--   gui = 'none'
		-- 	--   },
		-- 	buffer_visible = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	close_button = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	close_button_visible = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	-- close_button_selected = {
		-- 	--   guifg = {attribute='fg',highlight='TabLineSel'},
		-- 	--   guibg ={attribute='bg',highlight='TabLineSel'}
		-- 	--   },
		--
		-- 	tab_selected = {
		--   		fg = { attribute = "fg", highlight = "Normal" },
		--   		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	tab = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	tab_close = {
		--   		-- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
		--   		fg = { attribute = "fg", highlight = "TabLineSel" },
		--   		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	duplicate_selected = {
		--   		fg = { attribute = "fg", highlight = "TabLineSel" },
		--   		bg = { attribute = "bg", highlight = "TabLineSel" },
		--   		italic = true,
		-- 	},
		-- 	duplicate_visible = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		--   		italic = true,
		-- 	},
		-- 	duplicate = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 		italic = true,
		-- 	},
		-- 	modified = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	modified_selected = {
		--   		fg = { attribute = "fg", highlight = "Normal" },
		--   		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	modified_visible = {
		--   		fg = { attribute = "fg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	separator = {
		--   		fg = { attribute = "bg", highlight = "TabLine" },
		--   		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	separator_selected = {
		--   		fg = { attribute = "bg", highlight = "Normal" },
		--   		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	-- separator_visible = {
		-- 	--   guifg = {attribute='bg',highlight='TabLine'},
		-- 	--   guibg = {attribute='bg',highlight='TabLine'}
		-- 	--   },
		-- 	indicator_selected = {
		--   		fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
		--   		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
  -- 		},
	},
}
