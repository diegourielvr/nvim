return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig["lua_ls"].setup({
			on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
				local bufopts = { noremap=true, silent=true, buffer=bufnr }
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

				local navic = require ('nvim-navic')
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end

			end,
		})
	end
}
-- local servers = {
-- 	"lua_ls",
-- 	"pyright",
-- 	"clangd",
-- 	"vimls",
-- 	"marksman",
-- }
--
-- local on_attach = function(client, bufnr)
-- 	-- Keymaps
-- 	local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 	local bufkeymap = vim.keymap.set
-- 	bufkeymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
-- 	bufkeymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
-- 	bufkeymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts) --abrir definición de una función como ctrl + tab
-- 	bufkeymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
-- 	bufkeymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
-- 	bufkeymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
-- 	bufkeymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)
-- 	bufkeymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", bufopts)
-- 	bufkeymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", bufopts)
-- 	bufkeymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
-- 	bufkeymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
-- 	bufkeymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts)
-- 	-- Others
-- 	local navic = require ('nvim-navic')
-- 	-- local illuminate = require ('illuminate')
-- 	-- illuminate.on_attach(client)
-- 	if client.server_capabilities.documentSymbolProvider then
--         navic.attach(client, bufnr)
--     end
-- end
--
-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		config = function()
-- 			require('mason').setup({
-- 				max_concurrent_installers = 4,
-- 				-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
-- 				ui = {
-- 					border = "rounded",
-- 					icons = {
-- 						-- The list icon to use for installed packages.
-- 						-- package_installed = "◍",
-- 						package_installed = "✓",
-- 						-- The list icon to use for packages that are installing, or queued for installation.
-- 						-- package_pending = "◍",
-- 						package_pending = "➜",
-- 						-- The list icon to use for packages that are not installed.
-- 						-- package_uninstalled = "◍",
-- 						package_uninstalled = "✗"
-- 					},
-- 				}
-- 			})
-- 		end,
-- 	}, -- Administrador de paquetes LSP, DAP, Linter, Formatter.
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		opts = {
-- 			automatic_installation = true,
-- 			ensure_installed = servers,
-- 		}
-- 	}, -- Puente entre Administrador Mason y Configurador nvim-lspconfig
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		event = { "BufReadPre", "BufNewFile" },
-- 		dependencies = {
-- 			{"mason.nvim" },
-- 			{"williamboman/mason-lspconfig.nvim"},
-- 		},
--
-- 		config = function()
-- 			-- Definir simbolos de la columna de signos
-- 			-- local signs = {
-- 			-- 	{ name = "DiagnosticSignError", text = "" },
-- 			-- 	{ name = "DiagnosticSignWarn", text = "" },
-- 			-- 	{ name = "DiagnosticSignHint", text = "" },
-- 			-- 	{ name = "DiagnosticSignInfo", text = "" },
-- 			-- }
-- 			-- for _, sign in ipairs(signs) do
-- 			-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
-- 			-- end
-- 			--
-- 			-- local config = {
-- 			-- 	virtual_text = true, -- disable virtual text
-- 			-- 	signs = {
-- 			-- 		active = signs, -- show signs
-- 			-- 	},
-- 			-- 	update_in_insert = true,
-- 			-- 	underline = true,
-- 			-- 	severity_sort = true,
-- 			-- 	float = {
-- 			-- 		focusable = true,
-- 			-- 		style = "minimal",
-- 			-- 		border = "rounded",
-- 			-- 		source = "always",
-- 			-- 		header = "",
-- 			-- 		prefix = "",
-- 			-- 	},
-- 			-- }
-- 			-- vim.diagnostic.config(config)
--
-- 			-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 			-- 	border = "rounded",
-- 			-- })
-- 			--
-- 			-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 			-- 	border = "rounded",
-- 			-- })
--
-- 			local lspconfig = require('lspconfig') -- nvim-lspconfig
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 			local opts = {}
--
-- 			for _, server in pairs(servers) do
-- 				opts = {
-- 					capabilities = capabilities, -- (atributo) Capacidades del servidor
-- 					on_attach = on_attach-- (metodo) Despues de iniciar un servidor el cliente se conecta y agrega keymaps al buffer conectado al servidor https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D#on_attach
-- 				}
--
-- 				-- Configuración de servidores individuales
-- 				local require_ok, conf_opts = pcall(require, "daik.plugins.lsp.settings." .. server)
-- 				if require_ok then
-- 					opts = vim.tbl_deep_extend("force", conf_opts, opts)
-- 				end
-- 				-- Inicar servidor y cliente
-- 				lspconfig[server].setup(opts) -- https://neovim.io/doc/user/lsp.html#vim.lsp.client
-- 			end
-- 		end,
-- 	},
-- }
