return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require('null-ls')
		-- local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.fish_indent,
				null_ls.builtins.diagnostics.fish,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.flake8,
			}
			-- debug = false,
			-- sources = {
			-- 	formatting.prettier.with({
			-- 		extra_filetypes = { "toml" },
			-- 		extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			-- 	}),
			-- 	formatting.black.with({ extra_args = { "--fast" } }),
			-- 	formatting.stylua,
			-- },
		})
	end,
}
