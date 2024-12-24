return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	version = false, -- last release is way too old and doesn't work on Windows
	event = { "VeryLazy" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	opts = {
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (or "all")
		ignore_install = { "jsonc" },

		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
		ensure_installed = {
			"c",
			-- "css",
			"cpp",
			-- "diff",
			-- "html",
			-- "java",
			-- "javascript",
			-- "jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			-- "query",
			-- "toml",
			-- "tsx",
			-- "typescript",
			"vim",
			"vimdoc",
			-- "yaml",
			--"r",
			--"rust",
			-- "sql",
			--"julia",
			--"go",
		},
		highlight = { -- Consistent syntax highlighting.
			enable = true
		},
		indent = { -- indentation based on treesitter for the = operator. Experimental feature
			enable = true
		},
		incremental_selection = { -- Incremental selection based on the named nodes from the grammar.
			enable = true,
			keymaps = {
				-- init_selection = "<C-space>",
				-- node_incremental = "<C-space>",
				-- scope_incremental = false,
				-- node_decremental = "<bs>",
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	},
	config = function(_, opts)
		-- Es necesario un compilador como clangd para crear los analizadores
		-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
		require("nvim-treesitter.configs").setup(opts)
		require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
		-- require 'nvim-treesitter.install'.prefer_git = false
	end
}
