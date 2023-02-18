# Introducción a neovim

## Directorio de configuración

Se puede personalizar nvim con un archivo de configuración que contiene los comandos de inicialización necesarios. Este archivo es llamado init.vim (o init.lua) y se debe ubicar en la siguiente ruta: 
que se carguen automaticamente. Para esto dichos archivos deben encontrarse en la ruta correspondiente al sistema operativo:

- Windows
```Shell
~/Appdata/Local/nvim/init.lua
```
- Unix
```Shell
~/.config/nvim/init.lua
```
Crear la carpeta 'nvim' si no esta creada y dentro crear el archivo 'init'.

En init.lua podemos definir los comandos que queremos ejecutar, o bien, podemos llamar a diferentes archivos que contienen la configuración correspondiente a cada plugin u otro tipo de configuración del editor de texto, con la finalidad de tener un orden en nuestra configuración.

### Estructura de directorios

Lista de directorios a buscar para estos archivos en tiempo de ejecución
	filetype.lua	filetypes new-filetype
	autoload/	automatically loaded scripts autoload-functions
	colors/		color scheme files :colorscheme
	compiler/	compiler files :compiler
	doc/		documentation write-local-help
	ftplugin/	filetype plugins write-filetype-plugin
	indent/		indent scripts indent-expression
	keymap/		key mapping files mbyte-keymap
	lua/		Lua plugins
	pack/		packages :packadd
	parser/		treesitter syntax parsers
	plugin/		plugin scripts write-plugin
	query/		treesitter queries
	rplugin/	remote-plugin scripts
	spell/		spell checking files spell
	syntax/		syntax files mysyntaxfile

[Referencia](https://neovim.io/doc/user/options.html#'runtimepath')
Para cargar un código de lua utilizamos lo siguiente
```lua
require('nombre_modulo')
```
Si se encuentra dentro de un directorio utilizamos
```lua
require(nombre_directorio.nombre_modulo)
```
[Referencia](https://github.com/RicardoRien/nvim-lua-guide/blob/master/README.esp.md)

