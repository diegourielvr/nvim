return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require('null-ls')
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- local code_actions = null_ls.builtins.code_actions

		-- Para usar las fuentes es necesario instalarlos, se puede hacer manual o utilizando mason
		null_ls.setup({
			-- Configuración de null-ls: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
			border = "rounded", -- :NullLsInfo estilo de ventana
			sources = { -- Fuentes a instlar (formatters, diagnostics, linter, etc,). Más fuentes: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				-- Configuración de fuentes: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
				formatting.black.with({ extra_args = { "--fast" } }), -- python formatting
				-- formatting.clang_format, -- c, cpp, java, formatting /(Colision con LSP:clangd, clangd ya lo trae de forma nativa asi que no es necesario instalar un formating aparte: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997232858)
				formatting.markdownlint, -- Markdown formatting 
				formatting.shfmt, -- bash
				formatting.stylua, -- lua diagnostic 
				-- formatting.prettier.with({ -- formatting for javascript, ts, css, html, etc
				-- 	extra_filetypes = { "toml" },
				-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
				-- }),
				diagnostics.flake8, -- python diagnostic
				diagnostics.markdownlint, -- Markdown diagnostic
				-- code_actions.gitsigns
			}
			-- debug = false,
		})
	end,
}
