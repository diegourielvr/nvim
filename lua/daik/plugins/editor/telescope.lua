return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = function ()
				if vim.fn.executable("make") == 1 then return "make" end
				if vim.fn.executable("mingw32-make") == 1 then return "mingw32-make" end
			end,
			enabled = vim.fn.executable("make") == 1 or vim.fn.executable("mingw32-make") == 1,
		},
	},
	opts = {
		defaults = { -- :help telescope.defaults 
			sorting_strategy = "descending", -- "descending", "ascending". Determines the direction "better" results are sorted towards.
			layout_strategy = "horizontal", -- 'horizontal' | 'vertical' | 'center' | 'cursor' | 'flex'. Determines the default layout of Telescope pickers.
			layout_config = {
				prompt_position = "bottom", -- "bottom", "top"
				scroll_speed = 5, -- Number of lines to scroll through the preview
				mirror = false, -- Flip the location of the results/prompt and preview windows
				preview_width = 0.5, -- ancho del preview
				horizontal = { -- configuración de la estrategia horizontal
					width = 0.8, -- ancho total
					height = 0.8, -- alto total
				},
				preview_cutoff = 80, -- Número de cols para deshabilitar windows preview
			},
			prompt_prefix = "   ", -- The character(s) that will be shown in front of Telescope's prompt.
			selection_caret = " ", -- ''. The character(s) that will be shown in front of the current selection.
			entry_prefix = "  ", -- Prefix in front of each result entry. Current selection not included
			multi_icon = " ", -- Symbol to add in front of a multi-selected result entry.
			initial_mode = "insert", -- "insert", "normal"
			border = true, -- true, false. Boolean defining if borders are added to Telescope windows
			path_display = { "truncate" } , -- "hidden", "tail", "absolute", "smart", "shorten", "truncate"
			results_title = " Results",
			color_devicons = true, -- true, false
		},
		extensions = {
			file_browser = {
				-- theme = 'dropdown', -- estilo del explorador: 'ivy' | 'dropdown' | 'cursor'
				files = true,
				add_dirs = true,
				-- depth = 1,
				hidden = {
					file_browser = true, -- mostrar archivos ocultos
					folder_browser = true
				},
				dir_icon = "", -- icon for directory
				hijack_netrw = false, -- disables netrw and use telescope-file-browser in its place
				git_status = true, -- mostrar el estado de git de los archivos
				display_stat = { mode = false, size = false, date = false },
			},
			fzf = {
				fuzzy = true,                    -- false will only do exact matching
				override_generic_sorter = true,  -- override the generic sorter
				override_file_sorter = true,     -- override the file sorter
				case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
										   		 -- the default case_mode is "smart_case"
			}
		},
	},
	config = function (_,opts)
		require("telescope").setup(opts)
		require("telescope").load_extension('file_browser')
		require("telescope").load_extension('fzf')
	end,
	keys = {
		-- Open file_browser with the path of the current buffer
		{"<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR><C-h><Esc>", silent = true},
		{ "<leader>ff", ":Telescope find_files<CR>", silent = true, desc = "find files" }, --List files in your current working directory
		{ "<leader>of", ":Telescope oldfiles<CR>", silent = true, desc = "old files" }, -- Lists previously open files
		{ "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", silent = true, desc = "buscar en el buffer actual"}, -- Live fuzzy search inside of the currently open buffer
		{ "<leader>/", ":Telescope live_grep<CR>", silent = true, desc = "Buscar palabra en archivos" }, -- Buscar (de merna exacta) un string en el directoriod actual
		{ "<leader>sb", ":Telescope buffers<CR>", silent = true }, -- Lists open buffers in current neovim instance

		-- Lists Built-in pickers and run them on <cr>.
		{ "<leader>bi", ":Telescope builtin<CR>", silent = true },
		{ "<leader>ts", ":Telescope treesitter<CR>", silent = true }, -- Ctrl+l for menu
		{ "<leader>sk", ":Telescope keymaps<CR>", silent = true }, -- Lists normal mode keymappings
		{ "<leader>sc", ":Telescope commands<CR>", silent = true }, -- Lists available plugin/user commands and runs them on <cr>
		{ "<leader>cc", ":Telescope colorscheme<CR>", silent = true }, -- Lists available colorschemes and applies them on <cr>
		{ "<leader>sO", ":Telescope vim_options<CR>", silent = true }, -- Lists vim options, allows you to edit the current value on <cr>
		{ "<leader>sC", ":Telescope command_history<CR>", silent = true }, -- Lists commands that were executed recently, and reruns them on <cr>
		-- { "<leader>sh", ":Telescope highlights<CR>", silent = true }, -- Lists all available highlights
		-- { "<leader>tss", ":Telescope spell_suggest<CR>", silent = true }, -- Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>

		-- Git PICKERS
		{ "<leader>gc", ":Telescope git_commits<CR>", silent = true }, -- Lists git commits with diff preview
		{ "<leader>gb", ":Telescope git_branches<CR>", silent = true }, -- Lists all branches with log preview
		{ "<leader>gs", ":Telescope git_status<CR>", silent = true }, -- Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
		{ "<leader>gS", ":Telescope git_stash<CR>", silent = true }, -- Lists stash items in current repository with ability to apply them on <cr>
		-- { "<leader>fg", ":Telescope git_files<CR>", silent = true }, -- Fuzzy search through the output of git ls-files command


		-- LSP PICKERS
		-- { "<leader>sr", ":Telescope lsp_references<CR>", silent = true }, -- Lists LSP references for word under the cursor
		{ "<leader>sic", ":Telescope lsp_incoming_calls<CR>", silent = true }, -- Lists LSP incoming calls for word under the cursor
		{ "<leader>soc", ":Telescope lsp_outgoing_calls<CR>", silent = true }, -- Lists LSP outgoing calls for word under the cursor
		-- { "<leader>sds", ":Telescope lsp_document_symbols<CR>", silent = true }, -- Lists LSP document symbols in the current buffer
		-- { "<leader>sws", ":Telescope lsp_workspace_symbols<CR>", silent = true }, -- Lists LSP document symbols in the current workspace
		-- { "<leader>sdw", ":Telescope lsp_dynamic_workspace_symbols<CR>", silent = true }, -- Dynamically Lists LSP for all workspace symbols
		{ "<leader>sd", ":Telescope diagnostics<CR>", silent = true }, -- Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
		-- { "<leader>si", ":Telescope lsp_implementations<CR>", silent = true }, -- Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
		-- { "<leader>sD", ":Telescope lsp_definitions<CR>", silent = true }, -- Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
		-- { "<leader>st", ":Telescope lsp_type_definitions<CR>", silent = true }, -- Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope

	}
}
-- FILE_BROWSER EXTENSION
-- mappings = {
--         ["i"] = {
--           ["<A-c>"] = fb_actions.create,
--           ["<S-CR>"] = fb_actions.create_from_prompt,
--           ["<A-r>"] = fb_actions.rename,
--           ["<A-m>"] = fb_actions.move,
--           ["<A-y>"] = fb_actions.copy,
--           ["<A-d>"] = fb_actions.remove,
--           ["<C-o>"] = fb_actions.open,
--           ["<C-g>"] = fb_actions.goto_parent_dir,
--           ["<C-e>"] = fb_actions.goto_home_dir,
--           ["<C-w>"] = fb_actions.goto_cwd,
--           ["<C-t>"] = fb_actions.change_cwd,
--           ["<C-f>"] = fb_actions.toggle_browser,
--           ["<C-h>"] = fb_actions.toggle_hidden,
--           ["<C-s>"] = fb_actions.toggle_all,
--           ["<bs>"] = fb_actions.backspace,
--         },
--         ["n"] = {
--           ["c"] = fb_actions.create,
--           ["r"] = fb_actions.rename,
--           ["m"] = fb_actions.move,
--           ["y"] = fb_actions.copy,
--           ["d"] = fb_actions.remove,
--           ["o"] = fb_actions.open,
--           ["g"] = fb_actions.goto_parent_dir,
--           ["e"] = fb_actions.goto_home_dir,
--           ["w"] = fb_actions.goto_cwd,
--           ["t"] = fb_actions.change_cwd,
--           ["f"] = fb_actions.toggle_browser,
--           ["h"] = fb_actions.toggle_hidden,
--           ["s"] = fb_actions.toggle_all,
--         },
--
-- <C-d> = Down
-- <C-u> = up
