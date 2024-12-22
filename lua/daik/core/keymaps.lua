vim.g.mapleader = " " -- <leader> = <Space>
local keymap = vim.api.nvim_set_keymap
-- noremap: no recursive map, silent: no mostrar salida en linea de comandos
local opts = {noremap = true, silent = true}

-- General
-- Salir del modo insertar
keymap("i", "jk", "<Esc>", opts)
-- Abrir explorador nativo
-- keymap("n", "<leader>e", ":Ntree<CR>", opts)
-- Cerrar ventana. Cuando hay una ventana cierra nvim.
keymap("n", "<leader>q", ":q<CR>", opts)
-- Recargar cambios
-- keymap("n", "<leader>5", ":source %<CR>", opts)
-- Guardar cambios
keymap("n", "<leader>w", ":w<CR>", opts)

-- Autocomplete
--keymap("i", "<C-Space>", "<C-n>", opts) -- Mostrar popupmenu con autocompletado de palabras
--keymap("i", "<C-Space>", "<C-p>", opts)

-- Diagnostic
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- mostrar diagnostico de la linea actual:
-- keymap("n", "<leader>od", ":lua vim.diagnostic.open_float()<CR>", opts)
--keymap('n', '[d', vim.diagnostic.goto_prev)
--keymap('n', ']d', vim.diagnostic.goto_next)
--keymap('n', '<leader>ll', vim.diagnostic.setloclist)


-- Search
-- Dejar de resaltar resaltados de búsqueda
keymap("n", "<leader>nh", ":nohlsearch<CR>", opts)

-- Cursor
-- Moverse al final de la linea
keymap("n", "<leader>-", "$", opts)
-- Mover cursor a la ventana de la izquierda
keymap("n", "<C-h>", "<C-w>h", opts)
-- Mover cursor a la ventana de abajo
keymap("n", "<C-j>", "<C-w>j", opts)
-- Mover cursor a la ventana de arriba
keymap("n", "<C-k>", "<C-w>k", opts)
-- Mover cursor a la ventana de la derecha
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
-- Aumentar tamaño hacia arriba
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- Aumentar tamaño hacia abajo
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- Aumentar tamaño hacia la izquierda
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- Aumentar tamaño hacia la derecha
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer
keymap("n", "<leader>cb", ":close<CR>", opts)
keymap("n", "<leader>db", ":bdelete<CR>", opts)
-- Borrar buffer de la lista de buffers
-- keymap("n", "<leader>sb", ":buffers<CR>", opts)
-- -- Mostrar lista de buffers
-- Mostrar el siguiente buffer en la ventana actual
keymap("n", "<TAB>", ":bnext<CR>", opts)
-- Mostrar el buffer anterior en la ventana actual
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
-- Dividir ventana hacia abajo
keymap("n", "<leader>sh", ":split<CR>", opts)
-- Dividir ventana hacia la derecha
keymap("n", "<leader>sv", ":vsplit<CR>", opts)

-- Move block up and down
-- Mover hacia arriba el bloque de código seleccionado
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
-- Mover hacia abajo el bloque de codigo seleccionado
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)

-- Indent
-- Identar y mantener selección
keymap("v", "<", "<gv", opts)
-- Eliminar identación y mantener selección
keymap("v", ">", ">gv", opts)
-- Identar en modo normal: '>>'. Eliminar identacion: '<<'  
-- Identar en modo insertar: Ctrl+T: indent, Ctrl+D: delete indent

-- Terminal
-- Salir del modo insertar de la terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
-- Dividir terminal hacia abajo
keymap("n", "<leader>ht", ":split<CR> :term<CR>", opts)
-- Dividir terminal hacia la izquierda
keymap("n", "<leader>vt", ":vsplit<CR> :term<CR>", opts)

-- Extra Plugins
keymap("n", "<leader>T", ":lua TransparentScheme()<CR>", opts)
keymap("n", "<leader>D", ":lua DefaultScheme()<CR>", opts)
keymap("n", "<leader>L", ":Lazy<CR>", opts)
--keymap("n", "<leader>N", ":NullLsInfo<CR>", opts)
keymap("n", "<leader>M", ":Mason<CR>", opts)
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#commands
keymap("n", "<leader>I", ":LspInfo<CR>", opts)

--delete word M is Meta key (default is Alt)
-- <C-U>: elimita toda la linea antes del cursor, <C+W> solo una palabra
keymap("i", "<M-BS>", "<C-W>", opts)
-- delete one after word
keymap("i", "<M-Del>", "<C-O>dw", opts)
-- <Home>		cursor to first char in the line	     i_<Home>
-- <End>		cursor to after last char in the line	     i_<End>
-- CTRL-O		execute one command, return to Insert mode   i_CTRL-
