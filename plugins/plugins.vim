"Archivo para los Plugins a instalar
call plug#begin('~/.vim/plugged') "Lugar donde se van a instalar los plugins
" Temas
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
"Habilitar sintaxis
Plug 'sheerun/vim-polyglot'
"Highlight para cpp
Plug 'vim-jp/vim-cpp'
Plug 'joshdick/onedark.vim'
Plug 'safv12/andromeda.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'hzchirs/vim-material'
Plug 'atelierbram/Base2Tone-vim'

"IDE
Plug 'easymotion/vim-easymotion'
"Navegar con C-h C-l C-j C-k
Plug 'christoomey/vim-tmux-navigator'
"NERDTREE
Plug 'preservim/nerdtree'
"Permite agregar iconos
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/nerd-fonts'
"Color para nerdtree

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-java'
Plug 'clangd/coc-clangd'
"Plug 'neoclide/coc-python'
Plug 'MaskRay/ccls'
"Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
"colorizer plugin for #fe4918
Plug 'norcalli/nvim-colorizer.lua'
"Multiple cursor like in vscode
Plug 'terryma/vim-multiple-cursors'
"Have the indent lines 
Plug 'yggdroot/indentline'
"Comentar lineas
Plug 'preservim/nerdcommenter'

"Git Integration ______________
Plug 'mhinz/vim-signify' "Indica que se ha agregado o modificado
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' "Permite hacer add, commit, push, pull, etc.
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Smooth Scrolling
Plug 'psliwka/vim-smoothie'
"Fuentes parcheadas
Plug 'powerline/fonts'
Plug 'Lokaltog/vim-powerline'
Plug 'powerline/powerline'
"Pantalla de inicio
Plug 'mhinz/vim-startify'
"_____________________________
call plug#end() "Cerrar el apartado de instalacion de plugin
