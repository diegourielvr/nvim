"-------------------- ATAJOS --------------------
"<leader>: se activa usando la tecla lider
"<silent>: se activa usando solo la tecla asignada

"----------Buffers, ventanas y pestañas
"Guardar cambios
nnoremap <leader>w :w<CR>
"Cerrar pestaña o ventana actual
nnoremap <leader>qq :q<CR>
"Recargar archivo actual
nnoremap <leader>so :so %<CR>

"-----BUFFERS
"Abrir nuevo buffer/archivo vacio
nnoremap <leader>n :enew<CR>
"Cerrar buffer(cierra el archivo)
nnoremap <leader>ct :bdelete<CR> 
"nnoremap <leader>n :new<CR> nuevo archivo y lo divide en dos la pestaña
"TAB en modo normal se movera al siguiente buffer/ventana
nnoremap <silent> <TAB> :bnext<CR>
"SHIFT-TAB en modo normal se movera al buffer/ventana anterior
nnoremap <silent> <S-TAB> :bprevious<CR>

"-----VENTANA
"Crear y brir archivo actual en un nuevo buffer y dividir ventana horizontalmente
nnoremap <leader>hs :split<CR>
"Crear y abrir archivo actual en un nuevo buffer y dividir ventana verticalmente
nnoremap <leader>vs :vsplit<CR>
"Cerrar una ventana
"Podemos usar :q o :close
"moverse entre ventanas
"<Ctrl+h> -> moverse a ventana izq
"<Ctrl+j> -> moverse a ventana abajo
"<Ctrl+k> -> moverse a ventana arriba
"<Ctrl+l> -> moverse a ventana der


"-----PESTAÑAS
"Crear nueva pestaña
nnoremap <leader>t :tabe<CR>
" tambien podemos usar :tabnew
"Cerrar una pestaña
":tabclose o :q
"Moverse entre pestañas
"Moverse a la siguiente pestaña
"<Ctrl+Repag> -> :tabNext o :tabn
"Moverse a una pestaña anterior
"<Ctrl+Avpag> -> :tabprevious o :tabp



"----------Desplazar ventanas en modo normal
nmap <leader><UP> :resize +5<CR>
nmap <leader><DOWN> :resize -5<CR>
nmap <leader><RIGHT> :vertical resize +5<CR>
nmap <leader><LEFT> :vertical resize -5<CR>



"----------Abrir explorador de archivos NERDTree
nmap <leader>e :NERDTreeToggle<CR>
"Para crear archivos, borrar, cerrar, etc...
"Abrir el navegador de archivos <leader>e
"Presionar m en el navegador de archivos y se despliegan las opciones



"----------Mover bloques de vodigo en modo visual
"j y k selecciona codigo hacia abajo y arriba
"h y l selecciona codigo hacia izquierda y derecha
""Debe ser en mayuscula, podemos presionar shift o tener activado las mayus
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
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
"Buscar lineas en el mismo archivo
nmap <leader>ls :BLines<CR>
"Buscar lineas en los buffers abiertos
nmap <leader>ll :Lines<CR>
"Muestra los buffers abiertos
nmap <leader>bs :Buffers<CR>
":Files (es equivalente a :FZF)
":FZF ~ buscar archivos en el directorio personal
"nmap <leader>rg :Rg<CR> comando para user linux



"Mostrar nombre de los temas instalados
nmap <leader>cs :Colors<CR>



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
"    			*ejemplo 
" 				*/



"---------Deshacer y rehacer
"undo
"en modo normal pulsar <u>
"redo
"en modo normal pulsar <Ctrl+r>
"Entrar en modo visual - v-line
"visual = v (lower-case)
"v-line = V (upper-case)
"$ = ir al final de la linea, en modo v, V se selecciona toda la linea
"0 = ir al inicio de la linea

"----------Coc-Settings
"-----java
"gd, gi, 


"----------Salir del modo insertar en la terminal
"tnoremap <leader> <Esc> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" Configuracion fold marker ------ {{{
augroup config_setting
  autocmd!
  autocmd FileType vim setlocal foldlevel=0 foldmethod=marker
  autocmd FileType cpp setlocal foldlevel=0 foldmethod=marker
  autocmd FileType html setlocal foldlevel=0 foldmethod=marker
augroup END
"}}}
"Para agregar un marcador que oculte codigo agregarmos lo que queremos ocultar
"u organizar entre llaves:
" Para abrir este marcador, presionar 'zo' o 'za' {{{  
"/*Code*/ 
"}}} Para ocultar este marcador, presionar 'zc' o 'za'

"moverse al inicio de una linea: _
"moverse al final de una linea: $
