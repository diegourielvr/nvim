-- Lista de servidores
local servers = require("daik.plugins.lsp.servers").servers

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup({
				max_concurrent_installers = 4,
				-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
				ui = {
					border = "rounded",
					icons = {
						-- The list icon to use for installed packages.
						-- package_installed = "◍",
						package_installed = "✓",
						-- The list icon to use for packages that are installing, or queued for installation.
						-- package_pending = "◍",
						package_pending = "➜",
						-- The list icon to use for packages that are not installed.
						-- package_uninstalled = "◍",
						package_uninstalled = "✗"
					},
				}
			})
		end,
	}, -- Administrador de paquetes LSP, DAP, Linter, Formatter.
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = servers
		}
	}, -- Puente entre Administrador Mason y Configurador nvim-lspconfig
}
