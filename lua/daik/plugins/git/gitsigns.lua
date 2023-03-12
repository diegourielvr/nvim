return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
    		add = { hl = "GitSignsAdd", text = " ", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    		change = { hl = "GitSignsChange", text = " ", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    		delete = { hl = "GitSignsDelete", text = " ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    		changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			untracked = { text = "▎" },
  		},
  		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  		numhl = false, -- Toggle with `:Gitsigns toggle_numhl` (Cambiar color en columna de numeros al color del estado de la linea)
  		linehl = false, -- Toggle with `:Gitsigns toggle_linehl` (Cambiar color de toda la linea al color del estado de git)
 		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  		watch_gitdir = {
    		interval = 1000,
    		follow_files = true,
  		},
  		attach_to_untracked = true,
  		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame` (información del commit al final de la linea)
  		current_line_blame_opts = {
   			virt_text = true,
    		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    		delay = 500,
    		ignore_whitespace = false,
  		},
  		current_line_blame_formatter_opts = {
    		relative_time = false,
  		},
  		sign_priority = 6,
 		update_debounce = 100,
  		status_formatter = nil, -- Use default
  		max_file_length = 40000,
  			preview_config = {
    		-- Options passed to nvim_open_win
    		border = "single",
    		style = "minimal",
    		relative = "cursor",
    		row = 0,
    		col = 1,
  		},
  		yadm = {
    		enable = false,
  		},
	}
}
