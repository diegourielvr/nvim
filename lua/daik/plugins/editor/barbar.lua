return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	-- init = function() vim.g.barbar_auto_setup = true end, -- disable auto-setup
	opts = {
		animation = true, -- Enable/disable animations
		highlight_alternate = false, -- Disable highlighting alternate buffers
		highlight_inactive_file_icons = false, -- Disable highlighting file icons in inactive buffers
		highlight_visible = true, -- Enable highlighting visible buffers
		icons = {
			buffer_index = false,
			button = '',
		filetype = {
			enabled = true, -- Requires `nvim-web-devicons` if `true`
			custom_colors = false,
		},
			diagnostics = { -- Enables / disables diagnostic symbols
				[vim.diagnostic.severity.ERROR] = { enabled = false, icon = " " },
				[vim.diagnostic.severity.WARN] = { enabled = false, icon = " "},
				[vim.diagnostic.severity.INFO] = { enabled = false, icon = " "},
				[vim.diagnostic.severity.HINT] = { enabled = false, icon = "󰌶 " },
			},
			gitsigns = {
				added = { enabled = false, icon = '+' },
				changed = { enabled = false, icon = '~' },
				deleted = { enabled = false, icon = '-' },
			},
			separator = { left = '┃', right = '' },
			separator_at_end = false, -- If true, add an additional separator at the end of the buffer list
			modified = { button = '󰧞 ' }, -- Configure the icons on the bufferline when modified or pinned.
			pinned = { button = '', filename = true },
			preset = 'default', -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'

			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = false },
			inactive = { button = '×' },
			visible = { modified = { buffer_number = false } },
		},

		insert_at_end = true, -- If true, new buffers will be inserted at the start/end of the list.
		insert_at_start = false,
		-- Set the filetypes which barbar will offset itself for
		sidebar_filetypes = {
			-- Use the default values: {event = 'BufWinLeave', text = nil}
			NvimTree = true,
		},

		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = nil,
	},
	config = function(_, opts)
		require('barbar').setup(opts)
		vim.cmd("hi BufferDefaultTabpageFill guibg='None'")
		vim.cmd("hi BufferInactiveSign guifg='None'")
	end,
	keys = {
		{"<leader>bp", ":BufferPin<CR>", desc = "Buffer Pin or UnPin", mode = "n", silent = true},
		-- {"<leader>BP", ":BufferPick<CR>", desc = "Seleccionar Buffer por letra", mode = "n", silent = true},
		-- {"<leader>bc", ":BufferClose<CR>", desc = "Cerrar buffer actual sin cambios", mode = "n", silent = true},
		-- {"<leader>mn", ":BufferMoveNext<CR>", desc = "Mover buffer hacia delante", mode = "n", silent = true},
		-- {"<leader>mp", ":BufferMovePrevious<CR>", desc = "Mover buffer hacia atras", mode = "n", silent = true},
		-- {"<leader>bb", ":BufferOrderByBufferNumber<CR>", desc = "Ordenar buffers por número de buffer", mode = "n", silent = true},
		-- {"<leader>bl", ":BufferOrderByLanguage<CR>", desc = "Ordenar buffers por lenguaje", mode = "n", silent = true},
		-- {"<leader>bw", ":BufferOrderByWindowNumber<CR>", desc = "Ordenar buffers por número de ventana", mode = "n", silent = true},
	}
}
