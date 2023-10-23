-- Este pluggin muestra "code context" en la winbar
return {
	-- LspSaga brinda comandos para lsp mostrados en una ventana flotante
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	config = function()
		require("lspsaga").setup({
			preview = {
				lines_above = 0,
				lines_below = 10,
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			request_timeout = 2000,
			ui = {
				-- currently only round theme
				theme = "round",
				-- border type can be single,double,rounded,solid,shadow.
				border = "rounded",
				winblend = 0,
				expand = "",
				collaspe = "",
				preview = " ",
				code_action = "💡",
				diagnostic = "🐞",
				incoming = " ",
				outgoing = " ",
				-- colors = {
				--   --float window normal bakcground color
				--   -- CONFIGURAR LOS COLORES; PENDIENTE
				--   normal_bg = '#001525',
				--   --title background color
				--   title_bg = '#afd700',
				--   red = '#e95678',
				--   magenta = '#b33076',
				--   orange = '#FF8700',
				--   yellow = '#f7bb3b',
				--   green = '#afd700',
				--   cyan = '#36d0e0',
				--   blue = '#61afef',
				--   purple = '#CBA6F7',
				--   white = '#d1d4cf',
				--   black = '#1c1c19',
				-- },
				-- kind = {},
			},
			symbol_in_winbar = { -- Modificar el estilo de la winbar
				enable = true,
				ignore_patterns = {},
				separator = '  ',
				-- separator = '  ',
				hide_keyword = true,
				show_file = true,
				folder_level = 2, -- número de folers anteriores a mostrar
				respect_root = false,
				color_mode = false, -- Habilitar coloreado de palabras en winbar
			},
			diagnostic = {
				on_insert = false, -- deshabilitar diagnosticos en la esquina superior derecha
			},
			finder = {
				--percentage
				-- max_height = 0.5,
				-- force_max_height = false,
				keys = {
					jump_to = 'p',
					edit = { 'o', '<CR>' },
					vsplit = 'vs',
					split = 'hs',
					tabe = 't',
					tabnew = 'r',
					quit = { 'q', '<ESC>' },
					close_in_preview = '<ESC>'
				},
			},
		})
		vim.cmd "hi SagaWinbarSep guifg=#d1d4cf" -- Color del separador de winbar
	end,
	keys = {
		-- References and definition
		{ "<leader>lf",  "<cmd>Lspsaga lsp_finder<CR>",                 mode = "n",          silent = true },
		-- Code action
		{ "<leader>lc",  "<cmd>Lspsaga code_action<CR>",                mode = { "n", "v" }, silent = true },
		-- Rename
		-- { "<leader>lr",  "<cmd>Lspsaga rename<CR>",                     mode = "n",          silent = true },
		-- Show line diagnostics
		{ "<leader>ldl", "<cmd>Lspsaga show_line_diagnostics<CR>",      mode = "n",          silent = true },
		-- Show cursor diagnostics
		{ "<leader>ldc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",    mode = "n",          silent = true },
		-- Abrir/ojear el archivo de definición y poder modificarlo y guardarlo
		{ "<leader>ld",  "<cmd>Lspsaga peek_definition<CR>",            mode = "n",          silent = true },

		-- hover_doc utiliza el analizador markdown de treesitter para renderizar el hover
		-- Informacion de función o variable
		{ "<leader>lh",  "<cmd>Lspsaga hover_doc<CR>",                  mode = "n",          silent = true },

		-- Diagnostic jump can use `<c-o>` to jump back
		{ "<leader>lp",       "<cmd>Lspsaga diagnostic_jump_prev<CR>",       mode = "n",          silent = true },
		{ "<leader>ln",       "<cmd>Lspsaga diagnostic_jump_next<CR>",       mode = "n",          silent = true },

		-- Only jump to error
		-- {"[E", function()
		--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		-- end, mode = "n", silent = true },
		-- {"]E", function()
		--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		-- end, mode = "n", silent = true },

		-- Outline
		{ "<leader>lo",   "<cmd>Lspsaga outline<CR>",                    mode = "n",          silent = true },

		-- close floaterm
		{ "<A-d>",       [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], mode = "t",          silent = true },
	},
}
