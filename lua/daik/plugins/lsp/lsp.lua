-- Cargar plugins enn el siguiente orden:
-- 1. Mason -> Descargar servidores
-- 2. Mason-lspconfig -> Puentre entre Mason y nvim-lspconfig 
-- 3. nvim-lspconfig -> Configuración para servidores descargados

-- Para instalar un servidor es necesario agregarlo a la siguiente lista
local servers = { -- servers: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
	"lua_ls",
	"pyright",
	"clangd", -- { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
	"cssls", -- { "css", "scss", "less" }
	"jsonls", -- { "json", "jsonc" }, https://www.npmjs.com/package/vscode-json-languageserver#configuration
	"ts_ls", -- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
}

local diagnostic_config = { -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts
	underline = true, -- Usar subrayado para diagnosticos
	virtual_text = {
		spacing = 2,
        source = "if_many",
        prefix = ""
	}, -- Usar texto virtual para diagnosticos
	signs = true, -- Usar signos para diagnosticos
	float = { -- opciones para ventana flotante ()
		title = "󱉶 Diagnostic", -- titulo de la ventana flotante
		title_pos = "center", -- posición de la ventana flotante
		header = "Description:", -- cabecera del diagnostico
		border = "rounded", -- estilo de borde
		source = false, -- mostrar la fuente del diagnostico
		focusable = true, -- ventana flotante focusable
	},
	update_in_insert = true, -- Actualizar diagnosticos en modo insertar, de lo contrario, actualizar al salir del modo insertar
	severity_sort = true, -- Mostrar diagnosticos por grado de severidad
}
local signs = {
	-- https://neovim.io/doc/user/diagnostic.html#diagnostic-highlights
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "󰌶" },
	{ name = "DiagnosticSignInfo", text = "" },
}

-- Callback para asociar un buffer a un cliente
local on_attach = function(client, bufnr)
	-- vim.notify(string.format("Connecting server: %s", client.name), "info", { title = 'LSP connection' }) -- Mensaje de notificacion
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, {0})
	end
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- keymaps
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>SH", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", bufopts)
	vim.keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
	vim.keymap.set("n", "ptd", "<cmd>Lspsaga peek_type_definition<CR>", bufopts)

	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)

	vim.keymap.set("v", "gf", vim.lsp.buf.format, bufopts) -- vormatea lineas seleccionadas en modo visual
	vim.keymap.set("n", "gF", vim.lsp.buf.format, bufopts) -- Formatea todo el contenido del archivo

	vim.keymap.set("n", "<leader>ds", "<cmd>Lspsaga outline<CR>", bufopts)
	-- vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, bufopts) -- Document_symbol. Muestra variables,funciones del docuemnto actual. necesita de lsp
	vim.keymap.set("n", "<leader>dh", vim.lsp.buf.document_highlight, bufopts) -- resaltar variable en el documento actual
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.clear_references, bufopts) -- limpiar resaltado de variables en el documento actual
	-- vim.keymap.set("n", "<leader>ks", vim.lsp.buf.workspace_symbol, bufopts) -- Workspace. Muestra variables,funciones del directorio de trabajo actual. necesita de lsp

	vim.keymap.set("n", "do", "<cmd>Lspsaga show_buf_diagnostics<CR>", bufopts)
	-- vim.keymap.set("n", "do", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>sld", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "<leader>scd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "<leader>]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	-- vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next({buffer=0}), bufopts)
	vim.keymap.set("n", "<leader>[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	-- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev({buffer=0}), bufopts)
	-- vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, bufopts)

	-- Mostrar referencias o implementación de un variable o método particular
	vim.keymap.set("n", "gr", "<cmd>Lspsaga finder def+imp+ref<CR>", bufopts) -- Run :Lspsaga finder imp to search and preview implementation of interfaces.
	-- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)

	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

return {
	"neovim/nvim-lspconfig", -- 3
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim", -- 1
			cmd = "Mason",
			-- config = true -- Necesita una configuracion obligaotira (o dar unas opciones en opts) para ejecutar comandos de Mason 
			opts = {
				ui = {
					check_outdated_packages_on_open = true, -- Whether to automatically check for new versions when opening the :Mason window.
					border = "rounded", -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
					icons = {
						package_installed = "", -- The list icon to use for installed packages.
						package_pending = "󱋖", -- The list icon to use for packages that are installing, or queued for installation.
						package_uninstalled = "", -- The list icon to use for packages that are not installed.
					},
				},
			}
		},
		{
			-- Instalar los servidores con :LspInstall {server_name}
			"williamboman/mason-lspconfig.nvim", -- 2
			opts = {
				ensure_installed = servers,
				automatic_installation = true,
			},
			config = function (_, opts)
				require("mason-lspconfig").setup(opts)
			end

		},
		-- { "nvimdev/lspsaga.nvim" }
	},
	config = function()
		-- Configuracion de diagnosticos
		vim.diagnostic.config(diagnostic_config) -- Configuración delos diagnosticos nativos
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { text=sign.text, linehl='', numhl='', texthl=sign.name })
			-- vim.fn.sign_define(sign.name, { text=sign.text, linehl=sign.name, numhl=sign.name, texthl=sign.name })
		end

		-- Configuración de servidores
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) -- agregar capacidades de cmp para lsp
		local server_opts = {
			capabilities = capabilities,
			on_attach = on_attach
		}
		for _, server in pairs(servers) do
			local require_ok, server_settings = pcall(require, 'daik.plugins.lsp.settings.' .. server)
			local opts = {}
			if require_ok then
				opts = vim.tbl_deep_extend("force", server_settings, server_opts)
			end
			lspconfig[server].setup(opts)
		end
		-- require('lspconfig.ui.windows').default_options.border = 'rounded'
	end
}

