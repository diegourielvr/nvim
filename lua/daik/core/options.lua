local options = {
    -- General
    background = 'dark',
	fillchars="eob: ",								-- Pcultar ~ (tilde de buffer) por espacios
    timeoutlen = 500,								-- Tiempo de espera para un atajo (milisegundos)
    clipboard = "unnamedplus",						-- Portapapeles del sistema
    conceallevel = 0,								-- '' visible en archivos md
    showmode = true,
    showtabline = 2,								-- Mostrar pestaña (def: 1, 2: "always")
	termguicolors = true,
    -- Mouse
    mouse = "a",									-- Mouse disponible en todos los modos
    mousemoveevent = true,
    -- Linea de numeros
    number = true, 									-- Número de cada linea
    relativenumber = true,							-- Números de linea relativos al cursor
    numberwidth = 2,								-- Ancho de linea de números (def: 4)
    signcolumn = "auto",							-- Cuando mostrar la columnas de signos (yes: siempre, no: nunca, auto, number)
    -- Identacion	
    wrap = false,									-- Lineas de código en una sola linea
    autoindent = true,								-- Identación de linea actual en nuevas lineas (def: on)	
    backspace = "indent,eol,start",
    expandtab = false,								-- Espacios en lugar de tabs
    shiftwidth =  4, 								-- Número de espacios de una identación automática
    tabstop = 4,
    smartindent = true,								-- Más identación automática 	
    -- Linea de comandos
    cmdheight = 1,									-- Número de lineas para linea de comandos (def: 1)		
    -- Archivos
    confirm = true,									-- Guardar cambios antes de cerrar un buffer modificado
    fileencoding = "utf-8",
    swapfile = false,
	undofile = true,								-- Guardar automaticamente un historial de deshacer
	updatetime = 10000,
    -- Popup menu
    completeopt = {"menu", "menuone", "noselect"},	-- Popup menu de autocompletar en modo insertar	
	pumheight = 10,
    -- Resaltar posicion del cursor	
    cursorcolumn = false,							-- Habiliutar resaltado de columna
    cursorline = true,								-- Habilitar resaltado de linea
    cursorlineopt = {"number"},						-- (cursorline debe estar activado), "number": resasltar número de linea, "line": resaltar texto 
    ruler = true,									-- Número de linea y columna de la posición del cursor	
    -- Busqueda y resaltado (/, ?)
    hlsearch = true,								-- Mantener resaltado de coincidencias (:nohlsearch -> desmarcar resaltado)
    ignorecase= true, 								-- Busqueda con Minus resalta Mayus y Minus (/hola -> 'hola', 'Hola')
    smartcase = true,								-- Si buscamos con Mayus solo resalta Mayus (/Hola -> 'Hola')
    -- Scroll
    --scroll = 20, 									-- Lineas a desplazar con ctrl-d y ctrl-u (def: mitad de altura de pantalla actual)
    scrolloff = 10, 								-- Apartir de que número de linea empieza el scroll vertical (Entre más grande el número, mas centrado el cursor)
    sidescrolloff = 5,								-- Scroll horizontal
    -- Split
    splitbelow = true,								-- Deslpazar nuevas ventanas verticales hacia abajo
    splitright = true,								-- Desplazar nuevas ventanas horizontales hacia la derecha
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append { W = true, I = true, c = true }
--vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
