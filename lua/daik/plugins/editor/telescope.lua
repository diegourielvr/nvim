return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	event = "VeryLazy",
	dependencies = { 
		{ "nvim-lua/plenary.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "mingw32-make",
			enabled = vim.fn.executable("mingw32-make") == 1,
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "descending", -- "ascending","descending"
			winblend = 0, -- Configure winblend for telescope floating windows
			prompt_prefix = "  ", -- The character(s) that will be shown in front of Telescope's prompt.
			selection_caret = " ", -- The character(s) that will be shown in front of the current selection.
			layout_strategy = "horizontal",
			multi_icon = "+", -- Symbol to add in front of a multi-selected result entry. Replaces final character of |telescope.defaults.selection_caret| and |telescope.defaults.entry_prefix| as appropriate.
			initial_mode = "insert", -- "insert", "normal"
			border = true, -- true, false (show line borders)
			path_display = { "truncate" }, -- "hidden", "tail", "absolute", "smart", "shorten", "truncate"
			results_title = " Results",
			color_devicons = true, -- true, false
			layout_config = {
				prompt_position = "bottom", -- "bottom", "top"
				preview_cutoff = 120, -- Número de cols para deshabilitar windows preview
				scroll_speed = 5, -- Number of lines to scroll through the preview
			},
		},
		extensions = {
			file_browser = {
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				hide_parent_dir = false, -- ocultar ../ en el explorador de archivos
				dir_icon = "", -- icon for directory
				-- display_stat = false, -- order stat
				display_stat = { date = false, size = false, mode = true},
				git_status = true, -- mostrar el estado de git de los archivos
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
		require("telescope").load_extension( "file_browser" )
		require("telescope").load_extension( "fzf" )
	end,
	keys = {
		-- Extension (file_explorer)
		-- Open file_browser with the path of the current buffer
		{"<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR><C-h><Esc>", silent = true},

		-- Lists Built-in pickers and run them on <cr>.
		{ "<leader>bi", ":Telescope builtin<CR>", silent = true },
		{ "<leader>ts", ":Telescope treesitter<CR>", silent = true }, -- Ctrl+l for menu

		-- FILE PICKERS
		--List files in your current working directory
		{ "<leader>ff", ":Telescope find_files<CR>", silent = true },
		-- Fuzzy search through the output of git ls-files command
		{ "<leader>fg", ":Telescope git_files<CR>", silent = true },
		-- Buscar (de manera DIFUSA) un string en el directorio de trabajo actual.
		{ "<leader>fs", ":Telescope grep_string<CR>", silent = true },
		-- Buscar (de merna exacta) un string en el directoriod e trabajo actual
		{ "<leader>/", ":Telescope live_grep<CR>", silent = true },
		-- Live fuzzy search inside of the currently open buffer
		{ "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", silent = true },

		-- VIM PICKERS
		-- Lists open buffers in current neovim instance
		{ "<leader>sb", ":Telescope buffers<CR>", silent = true },
		-- Lists previously open files
		{ "<leader>so", ":Telescope oldfiles<CR>", silent = true },
		-- Lists available plugin/user commands and runs them on <cr>
		{ "<leader>sc", ":Telescope commands<CR>", silent = true },
		-- Lists commands that were executed recently, and reruns them on <cr>
		{ "<leader>sC", ":Telescope command_history<CR>", silent = true },
		-- Lists available help tags and opens a new window with the relevant help info on <cr>
		-- { "<leader>st", ":Telescope help_tags<CR>", silent = true },
		-- Lists available colorschemes and applies them on <cr>
		{ "<leader>cc", ":Telescope colorscheme<CR>", silent = true },
		-- Lists vim options, allows you to edit the current value on <cr>
		{ "<leader>sO", ":Telescope vim_options<CR>", silent = true },
		-- Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>
		{ "<leader>ss", ":Telescope spell_suggest<CR>", silent = true },
		-- Lists normal mode keymappings
		{ "<leader>sk", ":Telescope keymaps<CR>", silent = true },
		-- Lists all available highlights
		-- { "<leader>sh", ":Telescope highlights<CR>", silent = true },
		
		-- LSP PICKERS
		-- Lists LSP references for word under the cursor
		-- { "<leader>sr", ":Telescope lsp_references<CR>", silent = true },
		-- Lists LSP incoming calls for word under the cursor
		{ "<leader>sic", ":Telescope lsp_incoming_calls<CR>", silent = true },
		-- Lists LSP outgoing calls for word under the cursor
		{ "<leader>soc", ":Telescope lsp_outgoing_calls<CR>", silent = true },
		-- Lists LSP document symbols in the current buffer
		-- { "<leader>sds", ":Telescope lsp_document_symbols<CR>", silent = true },
		-- Lists LSP document symbols in the current workspace
		-- { "<leader>sws", ":Telescope lsp_workspace_symbols<CR>", silent = true },
		-- Dynamically Lists LSP for all workspace symbols
		-- { "<leader>sdw", ":Telescope lsp_dynamic_workspace_symbols<CR>", silent = true },
		-- Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
		{ "<leader>sd", ":Telescope diagnostics<CR>", silent = true },
		-- Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
		-- { "<leader>si", ":Telescope lsp_implementations<CR>", silent = true },
		-- Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
		-- { "<leader>sD", ":Telescope lsp_definitions<CR>", silent = true },
		-- Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
		-- { "<leader>st", ":Telescope lsp_type_definitions<CR>", silent = true },

		-- Git PICKERS
		-- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
		{ "<leader>gc", ":Telescope git_commits<CR>", silent = true },
		-- Lists all branches with log preview, checkout action <cr>, track action <C-t>, rebase action<C-r>, create action <C-a>, switch action <C-s>, delete action <C-d> and merge action <C-y>
		{ "<leader>gb", ":Telescope git_branches<CR>", silent = true },
		-- Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
		{ "<leader>gs", ":Telescope git_status<CR>", silent = true },
		-- Lists stash items in current repository with ability to apply them on <cr>
		{ "<leader>gS", ":Telescope git_stash<CR>", silent = true },
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
