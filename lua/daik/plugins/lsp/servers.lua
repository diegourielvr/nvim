local M = {}
M.servers = {
	"bashls",
	"lua_ls",
	"pyright",
	"clangd",
	"vimls",
	-- "marksman", -- deshabilitado por que el no encuentra el ejecutable (posible solución cambiar nombre de ejecutable: https://github.com/artempyanykh/marksman#option-2-use-pre-built-binary)
}
return M
