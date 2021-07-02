"-------------------- ATAJOS --------------------
"<leader>: se activa usando la tecla lider
"<silent>: se activa usando solo la tecla asignada

"---------- Archivos, Ventanas, Buffers
"Guardar cambios
nnoremap <leader>w :w<CR>
"Cerrar ventana actual (no cierra el buffer)
nnoremap <leader>qq :q<CR>
"Recargar archivo actual
nnoremap <leader>so :so %<CR>
"Abrir nueva ventana(no abre nuevo archivo)
nnoremap <leader>t :tabe<CR>
"Abrir nuevo archivo(archivo vacio)
nnoremap <leader>n :enew<CR>
"TAB en modo normal se movera a la siguiente ventana
nnoremap <silent> <TAB> :bnext<CR>
"SHIFT-TAB en modo normal se movera a la ventana anterior
nnoremap <silent> <TAB> :bprevious<CR>
"Cerrar buffer(cierra el archivo)
nnoremap <leader>ct :bdelete<CR>
"Abrir archivo actual en un nuevo buffer y dividir ventana horizontalmente
nnoremap <leader>hs :split<CR>
"Abrir archivo actual en un nuevo buffer y dividir ventana verticalmente
nnoremap <leader>vs :vsplit<CR>
"Salir del modo insertar en la terminal
tnoremap <leader> <Esc> <C-\><C-n>
"Abrir explorador de archivos NERDTree
nmap <leader>e :NERDTreeToggle<CR>
"Para crear archivos, borrar, cerrar, etc...
"Abrir el navegador de archivos <leader>e
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


"----------Mostrar/ocultar lineas de identacion
map <F3> :IndentLinesToggle<CR>


"----------Buscar con dos caracteres con easymotion
nmap<leader>s <Plug>(easymotion-s2)


"---------Buscador de archivos, buffers, etc...
"Buscar archivos en el directorio actual
nmap <leader>fs :FZF<CR>
"Buscar en el mismo archivo
nmap <leader>ls :BLines<CR>
"Buscar en los buffers abiertos
nmap <leader>ll :Lines<CR>
"Mostrar nombre de los temas instalados
nmap <leader>cs :Colors<CR>
"Muestra los buffers abiertos
nmap <leader>bs :Buffers<CR>
":Files (es equivalente a :FZF)
":FZF ~ buscar archivos en el directorio personal
"nmap <leader>rg :Rg<CR> comando para usr linux


"----------Multicursor
"En modo visual, para cambiar variables seleccionar primero todo el nombre de la variable
"Ctrl + n, nuevo cursor
"Ctrl + x, mover cursor a la siguiente palabra que haga match
"Ctrl + p, mover el cursor una palabra antes que haga match
"Esc, quitar multicursor



"----------Desplazamiento suavizado
"Ctrl + D = Desplazar hacia abajo 10 lineas
"Ctrl + F = Desplazar hacia abajo 22 lineas
"Ctrl + U = Desplazar hacia arriba 10 lineas
"Ctrl + B = Desplazar hacia arriba 22 lineas


"----------Comentar lineas Modo visual
"leader + cc = //ejemplo
"leader + ci = Descomentar lineas
"leader + cm = /*ejemplo*/
"leader + cs = /*
"    					  *ejemplo 
" 						  */

