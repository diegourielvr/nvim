return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		require ('telescope').setup({
			defaults = {
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				prompt_prefix = "  ",
				selection_caret = " ",
				path_display = { "smart" },
			}
		})
		-- Load file_browser
		require("telescope").load_extension "file_browser"

	end,
	keys = {
		-- Para más casos de uso ver: https://github.com/nvim-telescope/telescope.nvim#pickers
		{"<leader>t", ":Telescope<CR>", desc = "Mostrar incorporacines", mode = "n", silent = true},
		{"<leader>ff", ":Telescope find_files<CR>", desc = "Find Files", mode = "n", silent = true},
		{"<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers", mode = "n", silent = true},
		{"<leader>fw", ":Telescope live_grep<CR>", desc = "Find Word/string", mode = "n", silent = true}, -- Encontrar la cadena exacta (ho -> hola)
		{"<leader>fc", ":Telescope grep_string<CR>", desc = "Find characters", mode = "n", silent = true}, -- Encontrar coindicencias (ha -> hoooooola)
		{"<leader>FF", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Find characters in current file", mode = "n", silent = true}, -- Encontrar coindicencias (ha -> hoooooola)
		{"<leader>fr", ":Telescope oldfiles <CR>", desc = "Recently used files", mode = "n", silent = true},
		{"<leader>ft", ":Telescope help_tags<CR>", desc = "Find help tags (help pages)", mode = "n", silent = true},
		{"<leader>fh", ":Telescope command_history <CR>", desc = "Historial de comandos utilizados", mode = "n", silent = true},
		{"<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR> <Esc>", desc = "Buscador de archivos", mode = "n", silent = true},
		{"<leader>fn", ":Telescope notify<CR>", desc = "Buscador de notificaciones", mode = "n", silent = true},

		--{"<leader>fgs", ":Telescope git_stash<CR>", desc = "git stash", mode = "n", silent = true},
		{"<leader>fgs", ":Telescope git_status<CR>", desc = "git status", mode = "n", silent = true},
		{"<leader>fgb", ":Telescope git_branches<CR>", desc = "git branches", mode = "n", silent = true},
		{"<leader>fvo", ":Telescope vim_options <CR>", desc = "Vim options", mode = "n", silent = true},
		{"<leader>fds", ":Telescope diagnostics <CR>", desc = "Diagnostics", mode = "n", silent = true},
		{"<leader>fcs", ":Telescope colorscheme <CR>", desc = "Colorscheme", mode = "n", silent = true},

		{"<leader>lr", ":Telescope lsp_references <CR>", desc = "lsp references", mode = "n", silent = true},
		{"<leader>tb", ":Telescope builtin <CR>", desc = "builtin opstions", mode = "n", silent = true},

	},
}

--[[ <t_��>ý v:lua.cmp.utils.feedkeys.call.run(3)
--.
	-- Comandos para moverse en Telescope
	https://github.com/nvim-telescope/telescope.nvim#default-mappings
	Mappings		Action
	<C-n>/<Down>	Next item <C-p>/<Up>	Previous item
	j/k				Next/previous (in normal mode)
	H/M/L			Select High/Middle/Low (in normal mode)
	gg/G			Select the first/last item (in normal mode)
	<CR>			Confirm selection
	<C-x>			Go to file selection as a split
	<C-v>			Go to file selection as a vsplit
	<C-t>			Go to a file in a new tab
	<C-u>			Scroll up in preview window
	<C-d>			Scroll down in preview window
	<C-/>			Show mappings for picker actions (insert mode)
	?				Show mappings for picker actions (normal mode)
	<C-c>			Close telescope
	<Esc>			Close telescope (in normal mode)
	<Tab>			Toggle selection and move to next selection
	<S-Tab>			Toggle selection and move to prev selection
	<C-q>			Send all items not filtered to quickfixlist (qflist)
	<M-q>			Send all selected items to qflist

	-- Comandos para Telescope file browser
	https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
	Insert / Normal	fb_actions			Description
	<A-c>/c			create				Create file/folder at current path (trailing path separator creates folder)
	<A-r>/r			rename				Rename multi-selected files/folders
	<A-m>/m			move				Move multi-selected files/folders to current path
	<A-y>/y			copy				Copy (multi-)selected files/folders to current path
	<A-d>/d			remove				Delete (multi-)selected files/folders
	<C-o>/o			open				Open file/folder with default system application
	<C-g>/g			goto_parent_dir		Go to parent directory
	<C-e>/e			goto_home_dir		Go to home directory
	<C-w>/w			goto_cwd			Go to current working directory (cwd)
	<C-t>/t			change_cwd			Change nvim's cwd to selected folder/file(parent)
	<C-f>/f			toggle_browser		Toggle between file and folder browser
	<C-h>/h			toggle_hidden		Toggle hidden files/folders
	<C-s>/s			toggle_all			Toggle all entries ignoring ./ and ../
	<Tab>			see telescope.nvim	Toggle selection and move to next selection
	<S-Tab>			see telescope.nvim	Toggle selection and move to prev selection
]]--
