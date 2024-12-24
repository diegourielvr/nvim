vim.g.mapleader = " " -- <leader> = <Space>
local keymap = vim.api.nvim_set_keymap
-- noremap: no recursive map, silent: no mostrar salida en linea de comandos
local opts = {noremap = true, silent = true}

-- General
keymap("i", "jk", "<Esc>", opts) -- Salir del modo insertar
-- keymap("n", "<leader>e", ":Ntree<CR>", opts) -- Abrir explorador nativo
keymap("n", "<leader>q", ":q<CR>", opts) -- Cerrar ventana. Cuando hay una ventana cierra nvim.
-- keymap("n", "<leader>5", ":source %<CR>", opts) -- Cargar cambios
keymap("n", "<leader>w", ":w<CR>", opts) -- Guardar cambios

-- Search
keymap("n", "<leader>nh", ":nohlsearch<CR>", opts) -- Dejar de resaltar resaltados de búsqueda

-- Cursor
keymap("n", "<leader>-", "$", opts) -- Moverse al final de la linea
keymap("n", "<C-h>", "<C-w>h", opts) -- Mover cursor a la ventana de la izquierda
keymap("n", "<C-j>", "<C-w>j", opts) -- Mover cursor a la ventana de abajo
keymap("n", "<C-k>", "<C-w>k", opts) -- Mover cursor a la ventana de arriba
keymap("n", "<C-l>", "<C-w>l", opts) -- Mover cursor a la ventana de la derecha

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts) -- Aumentar tamaño hacia arriba
keymap("n", "<C-Down>", ":resize +2<CR>", opts) -- Aumentar tamaño hacia abajo
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Aumentar tamaño hacia la izquierda
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Aumentar tamaño hacia la derecha

-- Buffer
keymap("n", "<leader>cb", ":close<CR>", opts)
keymap("n", "<leader>db", ":bdelete<CR>", opts)
-- keymap("n", "<leader>sb", ":buffers<CR>", opts) -- Mostrar lista de buffers
keymap("n", "<TAB>", ":bnext<CR>", opts) -- Mostrar el siguiente buffer en la ventana actual
keymap("n", "<S-TAB>", ":bprevious<CR>", opts) -- Mostrar el buffer anterior en la ventana actual
keymap("n", "<leader>sh", ":split<CR>", opts) -- Dividir ventana hacia abajo
keymap("n", "<leader>sv", ":vsplit<CR>", opts) -- Dividir ventana hacia la derecha

-- Move block up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts) -- Mover hacia arriba el bloque de código seleccionado
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts) -- Mover hacia abajo el bloque de codigo seleccionado

-- Indent
keymap("v", "<", "<gv", opts) -- Identar y mantener selección
keymap("v", ">", ">gv", opts) -- Eliminar identación y mantener selección
-- Identar en modo normal: '>>'. Eliminar identacion: '<<'  
-- Identar en modo insertar: Ctrl+T: indent, Ctrl+D: delete indent

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Salir del modo insertar de la terminal
keymap("n", "<leader>ht", ":split<CR> :term<CR>", opts) -- Dividir terminal hacia abajo
keymap("n", "<leader>vt", ":vsplit<CR> :term<CR>", opts) -- Dividir terminal hacia la izquierda

-- Extra Plugins
keymap("n", "<leader>L", ":Lazy<CR>", opts)
keymap("n", "<leader>M", ":Mason<CR>", opts)
keymap("n", "<leader>I", ":LspInfo<CR>", opts) -- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#commands

-- <C-U>: elimita toda la linea antes del cursor, <C+W> solo una palabra
keymap("i", "<M-BS>", "<C-W>", opts) -- borrar la palabra anterior
keymap("i", "<M-Del>", "<C-O>dw", opts) -- borrar la siguiente palabra
--
-- M is Meta key (default is Alt)
-- <Home>		cursor to first char in the line	     i_<Home>
-- <End>		cursor to after last char in the line	     i_<End>
-- CTRL-O		execute one command, return to Insert mode   i_CTRL-

-- Custom
keymap("n", "<leader>T", ":lua TransparentScheme()<CR>", opts)
keymap("n", "<leader>D", ":lua DefaultScheme()<CR>", opts)
