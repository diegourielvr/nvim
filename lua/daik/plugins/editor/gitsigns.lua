return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add          = { text = '┃' },
			change       = { text = '┃' },
			delete       = { text = '┃' },
			topdelete    = { text = '┃' },
			changedelete = { text = '┃' },
			untracked    = { text = '┃' },
		},
		signs_staged = {
			add          = { text = '┃' },
			change       = { text = '┃' },
			delete       = { text = '_' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		},
		signs_staged_enable = true,
		signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
		numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			enable = true,
			follow_files = true
		},
		auto_attach = true, -- Automatically attach to files.
		attach_to_untracked = true, -- Attach to untracked files.
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true
		},
		current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
		sign_priority = 6,
		update_debounce = 100, -- Debounce time for updates (in milliseconds).
		status_formatter = nil, -- Use default
		max_file_length = 10000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = 'rounded',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1
		},
	},
	keys = {
    	{ "<leader>tgs", ":Gitsigns toggle_signs<CR>", mode="n", silent=true },
    	{ "<leader>gnh", ":Gitsigns next_hunk<CR>", mode="n", silent=true },
    	{ "<leader>gph", ":Gitsigns prev_hunk<CR>", mode="n", silent=true },
    	{ "<leader>gsh", ":Gitsigns preview_hunk<CR>", mode="n", silent=true },
    	{ "<leader>dt", ":Gitsigns diffthis<CR>", mode="n", silent=true },
	},
}
