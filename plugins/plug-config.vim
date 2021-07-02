"---------------Configuracion de los plugins---------------

"----------Configuracion de gruvbox
let g:gruvbox_contrast_dark = "hard"

"----------Configuracion Airline
"tema para la barra inferior
let g:airline_theme = 'desertink' "ayu_dark, behelit, dark_minimal, desertink, google_dark, raven, term, tomorrow, wombat, material 
"Los temas para la barra de inferior se encuentran en
"C:\Users\DIEGO\.vim\plugged\vim-airline-themes\autoload\airline\themes

"barra superior
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
"Configura el formato del nombre de ventana
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" airline symbols barra inferior
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :' "numero de linea
let g:airline_symbols.maxlinenr = ' ' "total de lineas
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.colnr = ' :' "numero de la columna actual
let g:airline_symbols.dirty='⚡'

"habilitar deteccion de modificacion
let g:airline_detect_modified=1
"habilitar deteccion de pegado
let g:airline_detect_paste=1
"habilitar deteccion clave
let g:airline_detect_crypt=1

"habilitar/desactivar integracion con fugitive
let g:airline#extension#branch#enable = 1

"por defecto airline usa simbolos unicode, si queremos usar sombolo powerline declaramos la siguiente variable
let g:airline_powerline_fonts = 1


"----------Configuracion NERDTree
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▽'

let g:airline#extensions#nerdtree_statusline = 1 "habilitar/deshabilitar statusline en nertdtree
let g:NERDTreeFileExtensionHighlightFullName = 1
let NERDTreeShowLineNumbers=1 
"let NERDTreeMinimalUI=1 "oculta el retorno de carpetas (up a dir)
"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


"----------Color de lineas de identacion
let g:indentLine_enabled = 0 "0 = deshabilitado 
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
":IndentLinesToggle activa y desactiva las líneas.
"let g:indentLine_char = '·'



"----------Dev icons
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 "alinear a la derecha los archivos
"let g:webdevicons_enable = 1 "habilitar iconos
"let g:webdevicons_enable_startify = 1


"----------NERDTree y git REVISAR
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
