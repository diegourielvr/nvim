"----------Aqui agregamos todos los plugins a instalar----------
call plug#begin('~/.vim/plugged') "lugar donde se van a instalar los plugins
"----------Temas sintaxis
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'safv12/andromeda.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'hzchirs/vim-material'
Plug 'atelierbram/Base2Tone-vim'

"----------Temas barra de estado
Plug 'shinchu/lightline-gruvbox.vim'

"----------Linea de estado
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"----------Sintaxis
"habilita resaltado de sintaxis
Plug 'sheerun/vim-polyglot'

"----------Iconos
Plug 'ryanoasis/vim-devicons'

"----------NERDTree explorador de archivos
Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin' "SIN FUNCION


"Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "color de sintaxis para nerdtree
"----------Autocompletar llaves
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"----------Navegar entre ventanas con C-h C-j C-k C-l
Plug 'christoomey/vim-tmux-navigator'

"----------Identacion
Plug 'yggdroot/indentline'

"----------Comentar lineas
Plug 'preservim/nerdcommenter'

"----------Desplazamiento suavizado
Plug 'psliwka/vim-smoothie'

"----------Buscar caracteres
Plug 'easymotion/vim-easymotion'

"----------Buscador FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"----------Multiple cursor
Plug 'terryma/vim-multiple-cursors'

"----------Integracion con git
Plug 'mhinz/vim-signify' "indica lineas agregadas, modificadas y eliminadas en un sistema de control de versiones
Plug 'tpope/vim-fugitive' "Permite usar los comandos de git (Digamos que es el Git)
Plug 'tpope/vim-rhubarb' "(Digamos que es el Hub)
Plug 'junegunn/gv.vim' "Navegador  de git commit

"----------Colores a codigos de colores hex
Plug 'lilydjwg/colorizer'

"----------Herramientas
Plug 'simrat39/rust-tools.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'rust-analyzer/rust-analyzer'

"----------COC Plugins
" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-json
":CocInstall coc-tsserver
":CocInstall coc-phpls
":CocInstall coc-clangd
":CocInstall coc-pyright
":CocInstall coc-vetur
":CocInstall coc-java Si menciona un error (The server crahsed n times...)
"     Pagina con el error mencionado: https://github.com/neoclide/coc-java/issues/99
"     Descargar .tar.gz de: https://download.eclipse.org/jdtls/milestones/0.57.0/
"     Extrar y reemplazar por los archivos de la ruta: ~\AppData\Local\coc\extensions\coc-java-data\server 
":CocInstall coc-html
Plug 'mhinz/vim-startify'
call plug#end() "cerrar el apartado de instalacion de plugins


