return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	opts = {
		-- Enable/disable animations
		animation = true,

		-- Disable highlighting alternate buffers
		highlight_alternate = false, -- Resaltar fondo o relleno de pestaña alternas

		-- Disable highlighting file icons in inactive buffers
		highlight_inactive_file_icons = false,

		-- Enable highlighting visible buffers
		-- highlight_visible = false,

		icons = {
			-- Configure the base icons on the bufferline.
			buffer_index = false, -- Mostrar número de todos los buffers
			button = '',

			-- Enables / disables diagnostic symbols
			diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = false, icon = " " },
					[vim.diagnostic.severity.WARN] = { enabled = false, icon = " "},
					[vim.diagnostic.severity.INFO] = { enabled = false, icon = " "},
					[vim.diagnostic.severity.HINT] = { enabled = false, icon = " " },
			},
			separator = { left = '▎', right = '' },

			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = '' },
			pinned = { button = '車' },
			--
			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			current = { -- Buffer actual
				buffer_index = false,
			},
			inactive = { -- Buffers abiertos inactivos
				button = '×',
				separator = { left = '▎', right = '' },
			},
			visible = { -- Ventanas horizontales o veticales

			}
		},
		-- If true, new buffers will be inserted at the start/end of the list.
		-- Default is to insert after current buffer.
		insert_at_end = true,
		insert_at_start = false,
		-- Sets the maximum padding width with which to surround each tab
		maximum_padding = 1,
		-- Sets the minimum padding width with which to surround each tab
		minimum_padding = 1,
		-- Sets the maximum buffer name length.
		maximum_length = 30,
		-- If set, the letters for each buffer in buffer-pick mode will be
		-- assigned based on their name. Otherwise or in case all letters are
		-- already assigned, the behavior is to assign letters in order of
		-- usability (see order below)
		semantic_letters = true,
		-- Set the filetypes which barbar will offset itself for
		sidebar_filetypes = {
			-- Use the default values: {event = 'BufWinLeave', text = nil}
			NvimTree = true,
		},
		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustement
		-- for other layouts.
		letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = nil,
	},
	keys = {
		{"<leader>bp", ":BufferPin<CR>", desc = "Buffer Pin or UnPin", mode = "n", silent = true},
		{"<leader>BP", ":BufferPick<CR>", desc = "Seleccionar Buffer por letra", mode = "n", silent = true},
		{"<leader>bc", ":BufferClose<CR>", desc = "Cerrar buffer actual sin cambios", mode = "n", silent = true},
		{"<leader>mn", ":BufferMoveNext<CR>", desc = "Mover buffer hacia delante", mode = "n", silent = true},
		{"<leader>mp", ":BufferMovePrevious<CR>", desc = "Mover buffer hacia atras", mode = "n", silent = true},
		{"<leader>bb", ":BufferOrderByBufferNumber<CR>", desc = "Ordenar buffers por número de buffer", mode = "n", silent = true},
		{"<leader>bl", ":BufferOrderByLanguage<CR>", desc = "Ordenar buffers por lenguaje", mode = "n", silent = true},
		{"<leader>bw", ":BufferOrderByWindowNumber<CR>", desc = "Ordenar buffers por número de ventana", mode = "n", silent = true},

	}
	-- config = function (_, opts)
	-- 	vim.cmd "hi BufferCurrentMod guifg=#ffcc00"
	-- 	vim.cmd "hi BufferInactiveMod guifg=#ffcc00"
	-- 	vim.cmd "hi BufferInactiveSign guifg=NONE" -- Fondo de separador de buffers inactivos
	-- end
}
