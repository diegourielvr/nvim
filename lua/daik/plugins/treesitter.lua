return {
	{
		"nvim-treesitter/nvim-treesitter", -- Analizadores sintácticos con diferentes modulos para resaltado, identación, llaves, etc. Blankline usa la interfaz para identación
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- Linea importante para ventana flotante de LSPSaga
			--require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
			require('nvim-treesitter').setup({
				-- Lista de nombres de analizadores sintácticos a instalar
				-- Lista de nombres de analizadores aceptados: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
				ensure_installed = {
					"lua",
					"markdown",
					"python",
					"c",
					"cpp",
					"java",
					"vim",
					"regex",
					"markdown_inline",
					"json",
					"php"
				},
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				sync_install = true,
				-- Lista de analizadores a ignorar enla instalacion (solo si ensura_installed = "all")
				ignore_install = {
					"phpdoc",
				},
				-- Resaltado
				highlight = {
					enable = true,
					-- Lista de analizadores (parser) que seran deshabilitados
					disable = {
						"css", "vim"
					}
				},
				autopairs = {
					enable = true,
				},
				indent = {
					enable = true,
					disable = {
						"css",
					}
				},
				incremental_selection = {
                	enable = true,
                	keymaps = {
                    	init_selection = "gnn",
                    	node_incremental = "grn",
                    	scope_incremental = "grc",
                    	node_decremental = "grm",
                	},
            	},
			})
			-- Linea importante para usuarios de windows y ventana flotante de LSPSaga
			-- Es necesario un compilador como clangd para crear los analizadores
			-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
			require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
		end,
	},
	{
		"MDeiml/tree-sitter-markdown",
	}
}
