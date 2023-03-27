-- indent guide
return {
	'lukas-reineke/indent-blankline.nvim',
	lazy = true,
	event = 'CursorMoved',
	opts = {
		space_char_blankline = " ",
		char = "│",
		show_current_context = false,
		show_trailing_blankline_indent = false,
		show_current_context_start = false,
		show_end_of_line = true,
		filetype_exclude = {
			'Regexplainer',
			'VGit',
			'alpha',
			'Alpha',
			'dashboard',
			'packer',
			'fugitive',
			'help',
			'neo-tree',
			'notify',
			'unix',
			'dressing',
		}
	}
}
