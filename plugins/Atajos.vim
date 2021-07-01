"-------------------- ATAJOS--------------------
"<leader>: se activa usando la tecla lider
"<silent>: se activa usando solo la tecla asignada
"----------ARCHIVOS, VENTANAS, BUFFERS
"Guardar archivos
nnoremap <leader>w :w<CR>
"Cerrar ventana(no cierra el buffer)
nnoremap <leader>qq :q<CR>
"Recargar archivo actual
nnoremap <leader>so :so %<CR>
"Abrir nueva ventana(no abre nuevo archivo)
nnoremap <leader>t :tabe<CR>
"Abrir nuevo archivo(archivo vacio)
nnoremap <leader>n :enew<CR>
"TAB en modo notmal se movera a la siguiente ventana
nnoremap <silent> <TAB> :bnext<CR>
"SHIFT-TAB en modo normal se movera a la ventana anterior
nnoremap <silent> <S-TAB> :bprevious<CR>
"Cerrar buffer(cierra el archivo)
nnoremap <leader>ct :bdelete<CR>
"Abrir archivo actual en nuevo buffer y dividir ventana horizontalmente
nnoremap <leader>hs :split<CR>
"Abrir archivo actual en nuevo buffer y dividir ventana verticalmente
nnoremap <leader>vs :vsplit<CR>
"Salir del modo insertar en la terminal
tnoremap <leader> <Esc> <C-\><C-n>

"Abrir explorador de archivos NERDTree
nmap <leader>e :NERDTree<CR>
"Para crear archivos, borrar, cerrar etc..
"Abrir el navegador de archivos leader + e"
"Presionar m en el navegador de archivos y se despliegan las opciones

"Mover bloques de vodigo en modo visual
"j y k selecciona codigo hacia abajo y arriba
"h y l selecciona codigo hacia izquierda y derecha
""Debe ser en mayuscula, podemos presionar shift o tener activado las mayus
xnoremap J :move '<-2<CR>gv-gv
xnoremap K :move '>+1<CR>gv-gv
"Quitar identacion
vnoremap < <gv
"Agregar identacion
vnoremap > >gv 

"----------BUSQUEDA
"Buscar con dos caracteres con easymotion
nmap<leader>s <Plug>(easymotion-s2)
nmap <leader>gs :CocSearch
"Buscar archivos
nmap <leader>fs :FZF<CR>
"Buscar en el mismo archivo
nmap <leader>bl :BLines<CR>
"Buscar en los buffers abiertos
nmap <leader>ll :Lines<CR>
"nmap <leader>rg :Rg<CR>
":Files
":Colors
"Buffers
"EN MODO INSERTAR, escribimos el numero al que quieres ir y das felcha arriba
"o abajo

"----------Comentar lineas Modo visual
"leader + cc = //ejemplo
"leader + ci = Descomentar lineas
"leader + cm = /*ejemplo*/
"leader + cs = /*
"    					  *ejemplo 
" 						  */

"----------COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""Multicursor
"En modo visual
"Ctrl + n, nuevo cursor
"Ctrl + x, mover cursor a la siguiente palabra
"Ctrl + p, mover el cursor una palabra antes
"Esc, quitar multicursor
