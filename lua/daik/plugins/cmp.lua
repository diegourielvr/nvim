--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "ﰮ",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "﬌",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "ﬦ",
	TypeParameter = "",
}

return {
	"hrsh7th/nvim-cmp", -- Motor de autocompletado. Necesita fuentes: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Autocompletar con palabras del buffer
		"hrsh7th/cmp-calc", -- Evaluar expresiones matemáticas. UNA FORMA es con el prefijo '=' o ':': =5+5. 
		"hrsh7th/cmp-path", -- Rutas de archivos y folders
		"max397574/cmp-greek", -- Letras griegas. Se activa con ':'. Ej. :beta = β
        "L3MON4D3/LuaSnip", -- Motor de snippets. Obtiene los snippets de friendly-snippets (source) 
		"saadparwaiz1/cmp_luasnip", -- (Intermediario entre nvim-cmp y LuaSnip) Utiliza el motor LuaSnip para obtener los snippets y los pasa a nvim-cmp. Digamos que este carga los snippets de LuaSnip y LuaSnip necesita la fuente friendly-snippets 
		"rafamadriz/friendly-snippets", -- contiene los snippets: https://github.com/rafamadriz/friendly-snippets/wiki
		'hrsh7th/cmp-nvim-lua', -- lua lsp
    	'hrsh7th/cmp-nvim-lsp', -- language-server-based completions
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		require("luasnip.loaders.from_vscode").lazy_load()

		local check_backspace = function()
			local col = vim.fn.col "." - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
		end
		cmp.setup({
		    snippet = { -- Motor de fragmentos a utilizar LuaSnip. 
			    expand = function(args)
				    luasnip.lsp_expand(args.body)
			    end
			},
			sources = { -- Source enable
			    { name = "nvim_lsp"}, -- SLP
				{ name = 'nvim_lsp_signature_help' },
			    { name = "luasnip"}, -- LuaSnip
				{ name = "buffer" },
				{ name = "calc" },
				{ name = "path" },
				{ name = 'greek' },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function (entry, vim_item)
					-- Kind icons (Texto mostrado del autocompletado: require  Text [Buffer]) 
					-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Simple
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({ -- Definie el tipo de menu (si esta vacio no se muestra))
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						buffer = "[Buffer]",
						calc = "[Calc]",
						path = "[Path]",
						greek = "[Greek]",
						-- nvim_lua = "[Lua]",
					})[entry.source.name]
					return vim_item
				end,
			},
			window = { -- Estilo de ventana del autocompletado y de la documentación del item seleccionado 
				completion = { -- Estilo del autocompletado
					border = "rounded", -- Estilo de borde 
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None", -- Colores de la ventana
				},
				documentation = { -- Estilo de la documentacion del texto autocompletado
					border = "rounded",
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
				},
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
			-- confirm_opts = {
			-- 	behavior = cmp.ConfirmBehavior.Replace,
			-- 	select = false,
			-- },
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Item previo
				["<C-j>"] = cmp.mapping.select_next_item(), -- Item siguiente
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }), -- Contenido de doc de item mover abajo
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }), -- Contenido de doc de item mover arriba
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-e>"] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm { select = true }, --/Documents and Settings/Diego/Documents/NVIM_RESPALDO/nvim-packer-v2/lua
				["<Tab>"] = cmp.mapping(function(fallback) -- Necesita LuaSnip para que Tab funcione normal en caso de no haber autocompletado
					if cmp.visible() then
					cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
				    "i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
				    "i",
					"s",
				}),
			},
		})
	end,
}
