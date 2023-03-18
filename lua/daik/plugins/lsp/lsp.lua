-- Lista de servidores
local servers = require("daik.plugins.lsp.servers").servers

local on_attach = function(client, bufnr)
	print("Conectado al servidor LSP: " .. client.name)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Keymaps
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufopts)
	-- Informacion de la funcion
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- format() necesita de null-ls.builtins.formatting.stylua para funcionar
	vim.keymap.set("v", "gf", vim.lsp.buf.format, bufopts) -- Formatea lineas seleccionadas en modo visual
	vim.keymap.set("n", "gF", vim.lsp.buf.format, bufopts) -- Formatea todo el contenido del archivo
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
	vim.keymap.set("n", "do", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, bufopts)
	-- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next({buffer=0}), bufopts)
	-- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev({buffer=0}), bufopts)
	-- Informacion de la funcion
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)

	-- local navic = require ('nvim-navic')
	-- if client.server_capabilities.documentSymbolProvider then
	-- 	navic.attach(client, bufnr)
	-- end
	-- local cmp = require("cmp")
end

local configDiagnostic = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn",  text = "" },
		{ name = "DiagnosticSignHint",  text = "" },
		{ name = "DiagnosticSignInfo",  text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- Configuracio´n de diagnosticos en: https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
	local config = {
		-- virtual_text = true, -- Mostrar diagnostico al final de la linea
		virtual_text = { spacing = 4, prefix = "󰗝" },
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true, -- Ordenar los diagnósticos por gravedad.
		float = {
			-- Configuracion de ventana flotante. La ventana se muestra con el comando <leader>do: vim.diagnostic.open_float()
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			title = "  Diagnostic ",
			title_pos = "center",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
	-- Configuración de algunas opciones que brinda lsp como hover, signaturehelp
	-- Lsp saga sobre escribe la siguiente instrucción
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "rounded",
	-- })
	-- Lsp_signature sobreescribe la siguiente instrucción 
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- })
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		configDiagnostic()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		local opts = {}
		opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}
		for _, server in pairs(servers) do
			local require_ok, conf_opts = pcall(require, "daik.plugins.lsp.settings." .. server)
			if require_ok then
				-- vim.tbl_deep_extend es la causa que muestra la Configuracion de lsp en la parte inferior derecha
				opts = vim.tbl_deep_extend("force", conf_opts, opts)
			end
			lspconfig[server].setup(opts)
		end
	end,
}
