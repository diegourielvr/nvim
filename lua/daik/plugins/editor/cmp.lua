local colors = {
	gray = "#808080",
	violet = "#646695",
	blue = "#569CD6",
	darkblue = "#223E55",
	lightblue = "#9CDCFE",
	green = "#6A9955",
	bluegreen = "#4EC9B0",
	lightgreen = "#B5CEA8",
	red = "#F44747",
	lightred = "#D16969",
	orange = "#CE9178",
	yelloworange = "#D7BA7D",
	yellow = "#DCDCAA",
	pink = "#C586C0",
	silver = "#C0C0C0",
}

local cmp_kind = {
	Text = { icon=' ', fg=colors.lightblue},
	Method = { icon=' ', fg=colors.bluegreen},
	Function = { icon=' ', fg=colors.bluegreen},
	Constructor = { icon=' ' },
	Field = { icon=' ' },
	Variable = { icon=' ', fg=colors.red },
	Class = { icon=' ' },
	Interface = { icon=' ', fg=colors.lightblue},
	Module = { icon=' ' },
	Property = { icon=' ', fg=colors.yellow},
	Unit = { icon=' ', fg=colors.yellow},
	Value = { icon=' ' },
	Enum = { icon=' ', fg=colors.yellow },
	Keyword = { icon=' ', fg=colors.orange },
	Snippet = { icon=' ' },
	Color = { icon=' ' },
	File = { icon=' ' },
	Reference = { icon=' ' },
	Folder = { icon=' ' },
	EnumMember = { icon=' ' },
	Constant = { icon=' ' },
	Struct = { icon=' ' },
	Event = { icon=' ' },
	Operator = { icon=' ' },
	TypeParameter = { icon=' ' },
}

return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Autocompletar con palabras del buffer
		"hrsh7th/cmp-path", -- Rutas de archivos y folders
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua", -- nvim api
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets", -- snippets for luasnip
		'hrsh7th/cmp-nvim-lsp',
	},
	enabled = true,
	config = function()
		local cmp = require("cmp")
		local luasnip = require('luasnip')
		require("luasnip.loaders.from_vscode").lazy_load()

		local opts = {
			snippet = { -- Motor de fragmentos a utilizar LuaSnip.
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			-- Orden de prioridad de las fuentes
			sources = {     -- Fuentes a utilizar para todos los buffers
				{ name = "nvim_lsp" }, -- nvim-lspconfig
				{ name = "luasnip" }, -- cmp_luasnip
				{ name = "path" }, -- cmp-path
				{ name = "buffer" }, --cmp-buffer
				{ name = "nvim_lua" }, -- cmp-nvim-lua
			},
			formatting = {
				-- fields = { 'kind', 'abbr', 'menu' },
				fields = { 'abbr', 'kind', 'menu' },
				format = function(entry, vim_item)
					-- vim_item.abbr = vim_item.abbr .. "\t(" .. vim_item.kind .. ")" -- name
					-- vim_item.kind = string.format("%s ", kind_icons[vim_item.kind]) -- Tipo
					vim_item.kind = string.format('%s %s', cmp_kind[vim_item.kind].icon, vim_item.kind) -- This concatonates the icons with the name of the item kind
					vim_item.menu = ({ -- Definie el tipo de fuente (source)
						nvim_lsp = "", -- '[lsp]'
						luasnip = "", -- '[snip]'
						nvim_lua = "", -- '[nvim]'
						buffer = "", -- '[buff]'
						path = "", -- '[path]'
					})[entry.source.name]
					return vim_item
				end,
			},
			window = {
				-- cmp.config.window.bordered: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/window.lua
				completion = require("cmp.config.window").bordered(),
				documentation = require("cmp.config.window").bordered()
			},
			experimental = {
				ghost_text = true,
				-- ghost_text = { -- true | { hl_group = string }
				-- hl_group = "CmpGhostText",
				-- },
				-- native_menu = false,
			},
			view = {
				entries = {
					name = "custom" -- 'custom' | 'wildmenu' | 'native'
				},
				docs = {
					auto_open = true,
				}
			},
			-- active = true,
			-- enabled = true,
			-- completion = {
			-- 	completeopt = "menu,menuone,noinsert",
			-- },
			mapping = {
				['<C-c>'] = cmp.mapping.complete(),
				-- SelectBehavior: Seleccinar comportamiento
				-- .Insert: Insertar texto
				-- .Select: Seleccionar sin insertar
				["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<S-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<C-a>'] = cmp.mapping.abort(),       -- Cerrar ventana de autocompletado
				["<C-d>"] = cmp.mapping.scroll_docs(-2),
				["<C-u>"] = cmp.mapping.scroll_docs(2),
				["<C-o>"] = cmp.mapping.open_docs(),
				["<C-h>"] = cmp.mapping.close_docs(),
			},
		}
		cmp.setup(opts)
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})
		-- `:` cmp-cmdline setup.
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})

		-- config for kind highlight
		for hi, value in pairs(cmp_kind) do
			vim.cmd(string.format("hi CmpItemKind%s guifg=%s", hi, value.fg))
		end
	end
}
