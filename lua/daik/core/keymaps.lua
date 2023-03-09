vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- Salir del modo insertar
keymap("i", "jk", "<Esc>", opts)
-- Navegador de archivos de neovim
--keymap("n", "<leader>e",":Ntree<CR>", opts)
-- Manipulacion de archivos
keymap("n", "<leader>w",":w<CR>", opts)
keymap("n", "<leader>c",":close<CR>", opts)
keymap("n", "<leader>bd",":bdelete<CR>", opts)
keymap("n", "<leader>q",":q<CR>", opts)
-- Move text up and down in visual / visual block
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
-- Mantener seleccion despues de identar
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Salir del modo insertar de la terminal
--keymap("t", "<Esc>", "<C-\><C-n>", opts)
-- Abrir archivo actual en un nuevo buffer y dividir ventana horizontalmente
keymap("n", "<leader>hs", ":split<CR>", opts)
--Abrir archivo actual en un nuevo buffer y dividir ventana verticalmente
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
-- Mover cursor entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- No resaltar buscquedas
keymap("n", "<leader>nh", ":nohlsearch<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Tab navigation
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
