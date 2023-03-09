-- indent guide
return {
	{

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
	},
	{
		"echasnovski/mini.indentscope", -- Efecto de linea de identación
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
		  -- symbol = "▏",
		  symbol = "│",
		  options = { try_as_border = true },
		},
		init = function()
		  vim.api.nvim_create_autocmd("FileType", {
			pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
			callback = function()
			  vim.b.miniindentscope_disable = true
			end,
		  })
		end,
		config = function(_, opts)
		  require("mini.indentscope").setup(opts)
		end,
	}
}
