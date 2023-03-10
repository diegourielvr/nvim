# Configuracion básica para LSP

## Introducción

Neovim proporciona una api "vim.lsp" que es un cliente LSP y brinda herramientas como go definition, hover, go references, etc. 
Los servidores LSP se instalan por aparte, se pueden instalar un administrador de paquetes de sevidores (Mason)
Un buffer establece una conexión mediante un canal con el cliente LSP y el cliente LSP, le envia
una solicitud attach al servidor parra que este monitoree los cambios del buffer y brinde las funciones que se establecela función attach.

El orden de los plugins es importante, Mason-lspconfig recomienda el siguiente: Mason > Mason-lspconfig > nvim-lspconfig
## Plugin Mason y Mason-lspconfig

Mason es un administrador de servidores, se encarga de descargar los servidores para LSP, Linters, DAP, etc.
Por lo que utilizaremos Mason para descargar los servidores desde neovim.
Además de que Mason brinda una interfaz para su uso

### Config Mason
```lua
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
} 
```
Si vamos a utilizar nvim-lspconfig para configurar un cliente LSP, Mason recomienda usar Mason-lspconfig
Mason-lspconfig se describe como un púente entre Mason y nvim-lspconfig, nvim-lspconfig utiliza otro tiop de nombres para los servidores
y además Mason utliza un tipo diferente de nombres, por lo que traduce estos nombres de lspconfig a mason y permite indicar los servidores que queremos instalar

### Config Mason-lspconfig
local servers = {
	"lua_ls",
	"vimls",
}
{
    "williamboman/mason-lspconfig.nvim",
    opts = {
        automatic_installation = true,
        ensure_installed = servers
    }
}

## Plugin nvim-lspconfig

Este plugin permite configurar los servidores de mancera sencilla.
Este plugin no es necesario para configurar los servidores, pero es muy útil o nos ahorra tiempo y busqueda de información
Permite configurar cada servidor con la función setup (lspconfig[server].setup{opts})

### Capabilities
### Función on_attach

En esta función podemos definir los atajos que el servidor va a escuchar y responder con la información necesaria
Esta función se ejecuta cada un cliente LSP se conecta a un buffer. Por lo que solo un cliente LSP se puede conectar a un buffer.
Mediante esta función el buffer actua como cliente y se puede comunicar con el servidor para realizar solicitudes de autcompletado o sugerencias, manejo de errores etc.
Esta función se utiliza para personalizar la configuración del cliente LSP en función del tipo de archivo.

Esta función recibe como parametros el cliente LSP "client" y el id de bufer "bufnr"

Ejemplo configurando el servidor LSP de lua:
```lua
lspconfig["lua_ls"].setup({
    on_attach = function(client, bufnr)
        print('Conectado al servidor LSP: ' .. client.name)
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
```
### Plugin nvim-navic y on_attach

Otros plugins pueden aprovecahar este cliente LSP para brindar caracteristicas como nvim-navic
Ejemplo: navic tiene una función attach para 
navic.attach(client, bufnr)

## Plugin null-ls


