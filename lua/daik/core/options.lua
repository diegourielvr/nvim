local options = {
	-- General
	background		= 'dark',
	clipboard		= 'unnamedplus', -- Guardar en el portapapeles del sistema
	mouse			= 'a', -- Habilitar mouse en todos los modos
	ruler			= true, -- Muestra el número de fila y columna del cursor
	showmode		= false, -- mostrar modo actual
	cmdheight		= 0, -- Altura de linea de comandos
	syntax			= "on",
	colorcolumn		= "80",
	shell 			= "pwsh.exe",
	termguicolors 	= true,
	timeoutlen 		= 500, -- Tiempo de espera de atajos (500ms)
	-- guifont = 'JetBrainsMono NF',
	-- rulerformat = "%-14.(%l,%c%V%)", -- Sobre escrito por statusline

	-- l: Abreviar lineas y bytes escritos 80L, 99B
	-- W: No mostrar mensaje de "written"
	-- I: don't give the intro message when starting Vim
	shortmess		= "lWIcCFoO",
	-- Muestra número de caracteres seleccionados en modo visual
	showcmd			= true,

	-- columns = 50, -- Columnas visibles en la pantalla
	--pumblend = 30, -- pseudo-tranaprencia para popup menus
	--winblend = 30, Psuedo-tranaparencia para la ventanas flotantes 
	--winbar = "Daik",-- Se configura como statusline

	-- Status
	-- %= :(section(left) %= section(right))
	-- %= %= :(section(selft) %= section(center) %= sectino(right))
	-- %- :Alinea a la izquierda
	-- ( :inicio de grupo, ): fin de gruop
	-- < :truncate
	statusline = "%<%t %m %y %= d41k  %= %-14.(%l,%c%V%) %P",

	-- Tabs
	showtabline = 2, -- Mostrar linea con cada tab

	-- Buffer
	fillchars 	= "eob: ", -- Cambia ~ por espacio vacio
	list 		= true,
	listchars	= "tab:  ,trail:󱁐,eol: ,space: ,nbsp:+",
	matchpairs 	= "(:),{:},[:],<:>,=:;", -- Forma parejas de caracteres. '%' Para saltar entre pares

	-- AutoComplete
	complete 	= ".,w,b,u,t", -- Completar: en modo INSERTAR press Ctrl+P o Ctrl+N
	completeopt = "menu,preview",

	-- FIle
	autoread 		= true, -- Detecta cambios fuera de neovim y los carga
	confirm 		= true, -- Confirma si guardar cambios antes de cerrir un buffer
	fileencoding 	= "UTF-8",
	swapfile 		= false,

	-- Indent
	tabstop 		= 4,
	expandtab		= false, -- Agrega espacios en lugar de tab
	autoindent 		= true, -- Copia identacion de linea actual (<CR>, 'o', 'O')
	backspace 		= "indent,eol,start",
	wrap 			= true, -- Wrap caracteres de lineas largas
	linebreak 		= false, -- Wrap palabras de lineas largas
	breakindent		= true, -- Identar 'wrapped lines' visualmente 
	breakindentopt 	= "shift:0", -- Identar wrapped line en base a linea anterior
	showbreak		= "...", -- Muestra string al inicio de lineas wrapped
	shiftwidth 		= 4,
	smartindent 	= true, -- Funciona mejor en C y algunos otros lenguajes
	smarttab 		= true,

	-- Cursor
	cursorcolumn 	= false, -- Muestra columna actual del cursor
	cursorline 		= true, -- Muestra linea actual del cursor
	cursorlineopt 	= "number", -- Opciones linea actual (number | line | screenline)
	-- Configura el estilo del cursor para cada modo
	guicursor 	= "n-v-c-sm:block-blinkwait900-blinkoff900-blinkon900,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait900-blinkoff400-blinkon200",

	-- Linea de números
	number 			= true, -- Mostrar linea de números
	numberwidth 	= 4, -- Ancho de linea de números
	relativenumber 	= true, -- Mostrar números relativos
	signcolumn 		= "auto", -- Mostrar columna de signos solo cundo se muestra alguno
	--statuscolumn = "%l", -- Muestra el caracter en la linea de números (%l:1,2,3, %r%relativenumber=true:1,0,1,%s)

	-- Search (/, ?)
	hlsearch 	= true, -- Resalta coincidencias (/)
	ignorecase 	= true, -- Ignora Máyus o Mínus en la búsqueda
	incsearch 	= true, -- Muestra coincidencias mientras escribimos
	smartcase 	= true, -- Sobreescribe 'ignorecase' cuando la búsqueda contiene Máyusculas

	-- Scroll
	scroll 			= 15, -- Número de lineas a scrollear (Ctrl+d, Ctrl+u)
	scrolloff 		= 0, -- Mínimo numero de lineas para comenzar a scrollear (j, k)
	sidescroll 		= 0, -- Número de caracteres finales para comenzar el scroll horizontal (si swap = false)
	sidescrolloff 	= 2, -- Mínimo número de caracteres al final para comenzar a scrollear (h, l, si wrap = false)

	--spell = true, -- Realiza correción ortográfica
	--spelllang = "en", -- Lenguaje del spell ("es_mx)

	-- Split
	splitbelow = true, -- Despliega una ventana vertical debajo de la actual
	splitright = true, -- Despliega una ventana horizontal a la derecha de la actual

	wildmenu = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
