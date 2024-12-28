-- https://nvimdev.github.io/lspsaga/breadcrumbs/
return {
	"nvimdev/lspsaga.nvim",
	event = 'LspAttach',
	dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
	opts = {
		ui = {
			border = 'rounded',
			devicon = true,
			foldericon = true,
			title = true,
			expand = '',
			collapse = '',
			code_action = '󰌶 ',
			actionfix = ' ',
			lines = { '┗', '┣', '┃', '━', '┏' },
			kind = nil,
			imp_sign = '󰳛 ',
		},
		symbol_in_winbar = {
			enable = false,
			separator = " › ",
			hide_keyword = false,
			ignore_patterns = nil,
			show_file = true, -- Show file name before symbols
			folder_level = 1, -- Show how many folder layers before the file name
			color_mode = true, -- Show how many folder layers before the file name
			delay = 300, -- Dynamic render delay
		},
		callhierarchy = { -- :Lspsaga incoming_calls and :Lspsaga outgoing_calls
			layout = 'float',
			left_width = 0.2,
			keys = {
				edit = 'e', -- edit = 'e' edit (open) file
				vsplit = 's', -- vsplit = 's' vsplit
				split = 'i', -- split = 'i' split
				tabe = 't', -- tabe = 't' open in new tab
				quit = 'q', -- quit = 'q' quit layout
				shuttle = '[w', -- shuttle = '[w' shuttle bettween the layout left and right
				toggle_or_req = 'u', -- toggle_or_req = 'u' toggle or do request
				close = '<C-c>k', -- close = '<C-c>k' close layout
			},
		},
		code_action = { -- Use :Lspsaga code_action to invoke
			num_shortcut = true, -- num_shortcut = true whether number shortcut for code actions are enabled
			show_server_name = false, -- show_server_name = false show language server name
			extend_gitsigns = false, -- extend_gitsigns = false extend gitsigns plugin diff action
			only_in_cursor = true,
			max_height = 0.3,
			keys = {
				quit = 'q', -- quit = 'q' quit the float window
				exec = '<CR>', -- exec = '<CR>' execute action
			},
		},
		definition = { -- La ventana de definición es como un buffer
			width = 0.6, -- width = 0.6 defines float window width
			height = 0.5, -- height = 0.5 defines float window height
			save_pos = false,
			keys = {
				vsplit = '<C-c>v', -- edit = '<C-c>o'
				split = '<C-c>s',
				tabe = '<C-c>t',
				tabnew = '<C-c>n',
				quit = 'q',
				close = '<C-c>k',
			},
		},
		diagnostic = {
			show_code_action = true, -- Show code action in diagnostic jump window. It’s useful. Suggested to set to true
			border_follow = true, -- Diagnostic jump window border follow diagnostic type
			show_layout = 'float', -- Config layout of diagnostic window not jump window
			text_hl_follow = true, -- Diagnostic jump window text highlight follow diagnostic type
			keys = {
				-- exec_action = 'o' execute action (in jump window)
				-- quit = 'q' quit key for the jump window
				quit = { 'q', '<ESC>' },
				-- toggle_or_jump = '<CR>' toggle or jump to position when in diagnostic_show window
				-- quit_in_show = { 'q', '<ESC>' } quit key for the diagnostic_show window
			}
		},
		finder = {
			default = 'ref+imp', -- ref+def+imp
			-- layout = 'float' available value is normal and float
			-- normal will use the normal layout window priority is lower than command layout
			layout = 'float',
			silent = false,
			keys = {
				shuttle = { '<TAB>', '<S-TAB>' }, -- shuttle = '[w' shuttle bettween the finder layout window
				toggle_or_open = 'o', -- toggle_or_open = 'o' toggle expand or open
				vsplit = 'vs', -- vsplit = 's' open in vsplit
				split = 'hs', -- split = 'i' open in split
				tabe = 't', -- tabe = 't' open in tabe
				tabnew = 'n', -- tabnew = 'r' open in new tab
				quit = 'q', -- quit = 'q' quit the finder, only works in layout left window
				close = '<C-c>k', -- close = '<C-c>k' close finder
			},
		},
		hover = {
			max_width = 0.9,
			max_height = 0.8,
			-- open_link = 'gx' key for opening links
			open_link = 'gx',
			-- open_cmd = '!chrome' cmd for opening links
			open_cmd = '!chrome',
		},

		-- When buffer has instances of the interface type, Lspsaga will show extra information for it: https://nvimdev.github.io/lspsaga/implement/
		implement = {
			enable = false, --enable
			sign = true, -- show sign in status column
			lang = {},
			virtual_text = true, -- show virtual text at the end of line
			priority = 100, -- sign priority
		},
		-- Automatically show lightbulbs when the current line has available code actions.
		lightbulb = {
			enable = true,
			sign = true, -- show sign in status column
			virtual_text = true, -- show virtual text at the end of line
			debounce = 10, -- timer debounce
			sign_priority = 40, -- sign priority
			enable_in_insert = true,
		},
		-- Es necesario habiliar symbols_in_win_bar=true o no funcionará
		outline = {
			win_position = 'right', -- window position
			win_width = 30, -- window width
			auto_preview = true, -- auto preview when cursor moved in outline window
			detail = true, -- show detail
			auto_close = true, --auto close itself when outline window is last window
			close_after_jump = false, -- close after jump
			layout = 'normal', -- float or normal default is normal when is float above options will ignored
			max_height = 0.5, -- height of outline float layout
			left_width = 0.3, -- width of outline float layout left window
			keys = {
				toggle_or_jump = 'o',
				quit = 'q', -- quit outline window
				jump = 'e', -- jump to pos even on a expand/collapse node
			},
		},
		rename = {
			in_select = true,
			auto_save = false, -- Auto save file when the rename is done
			project_max_width = 0.5,
			project_max_height = 0.5,
			keys = {
				quit = '<ESC>',
				exec = '<CR>',
				select = 'x',
			},
		},
		scroll_preview = {
			scroll_down = '<C-d>',
			scroll_up = '<C-u>',
		},
	},
	keys = {
		{ "<leader>tw", "<cmd>Lspsaga winbar_toggle<CR>",   silent = true }, -- breadcrumbs module: winbar_toggle
		{ "<leader>oc", "<cmd>Lspsaga outgoing_calls<CR>",  silent = true }, -- Callhierarchy module: outgoing_calls
		{ "<leader>ic", "<cmd>Lspsaga incomming_calls<CR>", silent = true }, -- Callhierarchy module: incomming_calls
	},
}
