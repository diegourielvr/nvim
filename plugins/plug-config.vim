"██████╗░██╗░░░░░██╗░░░██╗░██████╗░░░░░░░░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
"██╔══██╗██║░░░░░██║░░░██║██╔════╝░░░░░░░██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
"██████╔╝██║░░░░░██║░░░██║██║░░██╗░█████╗██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
"██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗╚════╝██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
"██║░░░░░███████╗╚██████╔╝╚██████╔╝░░░░░░╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
"╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░░░░░░░░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

"import COC config
"source ~/AppData/Local/Nvim/plugins/coc-config.vim
"source coc-config.vim
set t_Co=256
"----------Configuracion de gruvbox----------> https://github.com/morhetz/gruvbox
let g:gruvbox_contrast_dark = "medium" "Cambia el contraste del modo oscuro

"----------Configuracion de vim-airline------> https://github.com/vim-airline/vim-airline
"Seleccionar tema para la barra inferior
let g:airline_theme = 'desertink' "ayu_dark, behelit, dark_minimal, desertink, google_dark, raven, term, tomorrow, wombat, material 
"Los temas para la barra de abajo se encuentran en
"C:\Users\DIEGO\.vim\plugged\vim-airline-themes\autoload\airline\themes


"Habilitar la barra inferior
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
"Configura el formato del nombre de ventana
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.maxlinenr = ''

" Always show tabs
set showtabline=2

"Git integration config
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
" Colorear las señales
 "highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
 "highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
 "highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
":SignifyToggle,   sirve para ocultar o mostrar los signos de add, change etc
":SignifyToggleHighlight,   sirve para marcar en color las lineas agregadas,etc...

"----------Vim-devicons, neerd icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1 "Habilitar iconos para neerdtree
let g:webdevicons_enable_airline_tabline = 1 "Habilitar iconos para airline
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1

