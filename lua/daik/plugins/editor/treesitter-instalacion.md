# Instalaciónde treesitter para windows

TRee sitter es un analizador sintactico, quiere decir que analiza nuestro
código y lo organiza en un arbol sintactico.
Brinda funciones de resultado, indentacion, autollaves, etc.
Los dos principales problemas para su uso en windows en mi caso fueron:

1. Necesitaba un compilador de c, cpp como clangd e indicarle en la
configuración de treesitter que use este compilador
2. Marcaaba problemas de highlight en archivos como python y java, relacionados
con querys.
Parecido a esto: [Nvim-treesitter for windows users](https://github.com/nvim-treesitter/nvim-treesitter/issues/1201)

## Solucines

### Primer caso

Installar LLVM ya que contiene el compilador clang que utilizamos para resolver
este problema.
Además debemos indicar en la configuración de treesitter que compilador debe utilizar:

```lua
require("nvim-treesitter.install").compilers = { "clang", "gcc"}
```

Despues de indicar el compilador, debemos instalar manualmente los analizador
de cada lenguaje.
Para esto utilizamos el comando
> :TSInstall {lang}
Es importante este paso para reinstalar y recompilar los analizadores,
ya que despues de este paso se deberian solucionar los problemas.

### Segundo caso

Para el segundo caso posiblemente el problema era la versión de
nvim-treesitter y windows.
En la configuración de LazyVim del usuario folke, meniona lo siguiente:

> version = false, --last release is way too old and doesn't work on Windows
Encontrado en:[LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/treesitter.lua)

Este fragmento pertenece a la configuración del plugin
mediante el administrador de paquetes lazy.nvim
Si ya tenemos nvim-treesitter en windows, lo que haremos
es desinstalarlo (eliminandolo de la lista de plugins)

1. Con lazy.nvim (primero guardamos una copia del siguiente archivo)
eliminamos el archivo de configuración de nvim-treesitter.
2. Abrimos nvim nuevamente y limpiamos los plugins con lazy-nvim (Clear: X).
3. Nos aseguramos que nvim-treesitter no aparesca ninguna lista de plugins
(loaded, not loades, clear, etc) y cerramos nvim,
4. Agregamos el nuevamente nvim-treesitter a la lista de plugins y agregamos
el archivo de configuración, PERO con la opcion mencionada anteriormente:
Asegurese de agregar la siguiente linea en la configuración de
nvim-treesitter antes de instalar el plugin nuevamente

    - > version = false,

    - Con lazy.nvim se deberia ver algo así el archivo de configuración:

```lua
{
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
}
```

Finalemente abrimos nvim y esperamos a que se instale el plugin.
Cerramos y abrimos nuevamente nvim.

1. En este punto el problema seguramente aun no se resuleve,
lo que tenemos que hacer es reinstalar y recompilar los
analizadores que necesitamos
2. Para esto usamos el comando :TSInstall {lang}
para cada lenguaje que necesitamos y listo.

Este último paso es importante ya que despues de este el problema se soluciona.
