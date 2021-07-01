"----------------------------Configuracion NeoVim------------------------------
syntax on "Habilitar la sintaxis dentro de VIM
set number "Muestra los numeros de las lineas
set mouse=a "Permite la interaccion con mouse(seleccionar texto, mover el cursor)
set clipboard=unnamed "Usar el portapapeles como el registro predeterminado
set showcmd "Mostrar en la parte inferior de la pantalla los comandos ejecutados
set ruler "Mostrar el numero de linea y columna donde esta el cursor
set encoding=utf-8 "Configurar el formato de caracteres para que sea utf-8
set showmatch
set sw=4 "La tecla tab realiza 4 espacios 
set relativenumber "Los numeros de linea se muestran de forma relativa
let mapleader=" " "Espacio es la tecla lider para ejecutar los plugin
set laststatus=2
set backspace=2
set guioptions-=T "Sin barra de herramientas
set guioptions-=L
set nowrap "No dividir la linea si es muy larga
"set laststatus "Para que la linea de estatus de VIM siempre sea visible
set termguicolors
set autoindent
filetype indent on

"------------------Archivos de cabacera(Carga aqui el codigo)------------------
source ~/Appdata/Local/Nvim/plugins/plugins.vim "Agrega los plugins a instalar
source ~/Appdata/Local/Nvim/plugins/plug-config.vim "Configuracion de los plugins
source ~/Appdata/Local/Nvim/themes/onedark.vim "Configuracion del tema onedark
source ~/AppData/Local/Nvim/plugins/Atajos.vim "Atajos de teclas
luafile ~/Appdata/Local/Nvim/lua/plug-colorizer.lua
"------------------Fin archivos de cabecera------------------------------------
																
"Establecer modo oscuro
set background=dark "dark/light
"colorscheme gruvbox "Color del tema principal

colorscheme gruvbox "tokyonight, gruvbox, onedark, vim-material
"https://github.com/atelierbram/Base2Tone-vim


"----------Configuracion NERDTree
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▽'

"Startify y nerdtree, pantalla de inicio con marcadores
"{'atajo': 'ruta'}, 'ruta' podemos usar cualquiera de estas dos opciones para
"agregar un marcador en startify
let g:startify_bookmarks = [{'nv': '~/Appdata/Local/nvim'}, '~/Desktop/UAM TRIMESTRES']

