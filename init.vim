"----------------------------Configuracion NeoVim------------------------------
syntax on 		"habilitar el color de sintaxis
set number 		"muestra los numeros de las lineas
set mouse=a 		"permite la interaccion con mouse(seleccionar texto, mover el cursor)
set clipboard=unnamed 	"usar el portapapeles como el registro predeterminado
set showcmd 		"mostrar en la parte inferior de la pantalla de los comandos ejecutados
set ruler 		"mostrar el numero de la linea y columna donde esta el cursor
set encoding=utf-8 	"configurar el formato de caraccteres para que sea utf-8
set showmatch		"salta a un simbolo de apertura o cierre {[(/* if	etc...		*/)]}
set sw=4 		"tab realiza 4 espacios
set relativenumber 	"cambia el modo de los numeros de lineas, solo se muestra el numero delinea actual
let mapleader=" "	"espacio es lña tecla para ejecutar los plugin
set laststatus=2	"mostrar la linea de estado siempre
set backspace=2		"la tecla de retroceso funciona como los demas programas
"set guioptions-=T	"sin barra de herramientas
"set guioptions-=L
set nowrap		"no dividir la linea si es muy larga
set termguicolors	"nvim emite colores verdaderos(24 bits) de la terminal
set autoindent		"utiliza la identacion de la linea anterior
filetype indent on
set showtabline=2	"mostrar pestañas
set cursorline 		"resalta la linea actual

"------------------Archivos de cabacera(Carga aqui el codigo)------------------
source ~/Appdata/Local/Nvim/plugins/plugins.vim "Agrega los plugins a instalar
source ~/Appdata/Local/Nvim/plugins/plug-config.vim "Configuracion de los plugins
source ~/Appdata/Local/Nvim/plugins/atajos.vim "Archivo con atajos de teclado
"------------------Fin archivos de cabecera------------------------------------


"establecer modo oscuro
set background=dark "dark/light

"Color del tema principal
colorscheme gruvbox "gruvbox / onedark / andromeda / tokyonight / vim-material / Base2Tone_<complete the name>


"Startify y nerdtree, pantalla de inicio con marcadores
"{'atajo': 'ruta'}, 'ruta' podemos usar cualquiera de estas dos opciones para
"agregar un marcador en startify
"let g:startify_bookmarks = [{'nv': '~/Appdata/Local/nvim'}, '~/Desktop/UAM TRIMESTRES']
