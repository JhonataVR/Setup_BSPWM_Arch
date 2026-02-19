" ============================================================================
" --- OPTIMIZACIÓN Y SISTEMA ---
" ============================================================================
set nocompatible
filetype plugin indent on
syntax enable
let g:tex_flavor = "latex"

" --- DICCIONARIO (ESPAÑOL) ---
" Si el archivo está corrupto, esto intentará descargarlo de nuevo
set spell spelllang=es
set spellsuggest=best,5 " Sugiere solo las 5 mejores opciones
hi SpellBad gui=undercurl guisp=#FF0000 " Subrayado ondulado rojo para errores

" ============================================================================
" --- NAVEGACIÓN TOTAL (SIN TRABAS) ---
" ============================================================================
set whichwrap+=<,>,h,l,[,] 
set backspace=indent,eol,start 

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap <Left> <Left>
inoremap <Right> <Right>

" ============================================================================
" --- COMPORTAMIENTO DE ESCRITURA ---
" ============================================================================
set number
set termguicolors
set mouse=a
set clipboard=unnamedplus
set breakindent
set wrap
set scrolloff=10

" Guardado rápido
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" ============================================================================
" --- COLORES LLAMATIVOS Y AMIGABLES ---
" ============================================================================
hi Normal     guifg=#C5E1A5 guibg=NONE    
hi Comment    guifg=#555555 gui=italic
hi Statement  guifg=#00FF7F gui=bold       
hi Identifier guifg=#00FF7F
hi Type       guifg=#00FF7F
hi Special    guifg=#FFF59D                
hi Constant   guifg=#FF8A65                
hi LineNr     guifg=#444444 guibg=NONE
hi CursorLine guibg=#1a1a1a

" Reglas para que el texto de LaTeX sea el protagonista
autocmd FileType tex hi texNormal guifg=#C5E1A5
autocmd FileType tex hi texText   guifg=#C5E1A5
autocmd FileType tex hi texCmd    guifg=#00FF7F
autocmd FileType tex hi texMath   guifg=#FFF59D

" --- TRUCO EXTRA: Evitar que el corrector marque comandos de LaTeX ---
" Esto hace que el diccionario ignore lo que está dentro de comandos \text...
syn match texControlSequence /\\[a-zA-Z]\+/ contains=@NoSpell

" ============================================================================
" --- PERSONALIZACIÓN DE INTERFAZ (COLORES Y BARRAS) ---
" ============================================================================

" 1. BARRA DE ESTADO (La que dice el nombre del archivo, línea, col)
" guibg: fondo oscuro | guifg: letras verdes claras
hi StatusLine   guifg=#FFFFFF guibg=#007BFF gui=bold
hi StatusLineNC guifg=#FFFFFF guibg=#1a1a1a gui=none

" 2. NÚMEROS DE LÍNEA (Resaltar la línea actual)
hi LineNr       guifg=#007BFF guibg=NONE   " Números normales (gris oscuro)
hi CursorLineNr guifg=#00FF7F guibg=NONE gui=bold " Número de la línea donde estás

" 3. ÁREA DE COMANDOS Y MENSAJES (Abajo del todo)
hi MsgArea      guifg=#C5E1A5 guibg=NONE    " Texto de comandos (verde suave)
hi ModeMsg      guifg=#00FF7F gui=bold       " Mensaje de '-- INSERTAR --'
hi ErrorMsg     guifg=#FF8A65 gui=bold       " Mensajes de error
hi WarningMsg   guifg=#FFF59D                " Mensajes de advertencia

" 4. COLUMNA DE SIGNOS (Donde aparecen iconos de errores de spell o git)
hi SignColumn   guibg=NONE
hi FoldColumn   guibg=NONE

" 5. MENÚ DE AUTOCOMPLETADO (Si usas alguno, para que no sea blanco)
hi Pmenu        guifg=#C5E1A5 guibg=#1a1a1a
hi PmenuSel     guifg=#1a1a1a guibg=#00FF7F

" --- CONFIGURACIÓN DE LA BARRA DE ESTADO (StatusLine) ---
" Esto define QUÉ se muestra en la barra y cómo se ve.
set laststatus=2 " Asegura que la barra siempre sea visible
set statusline=
set statusline+=\ %f                        " Ruta del archivo
set statusline+=\ %m                        " Indicador de modificado [+]
set statusline+=\ %r                        " Indicador de solo lectura [RO]
set statusline+=%=                          " Separador (empuja lo demás a la derecha)
set statusline+=\ %y                        " Tipo de archivo (ej. [tex])
set statusline+=\ %p%%                      " Porcentaje del archivo
set statusline+=\ L:%l/C:%c                 " Línea : Columna
set statusline+=\                           " Espacio final

" Configurando la identación

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Configuración de portapapeles para init.vim
let g:clipboard = {
      \   'name': 'xclip',
      \   'copy': {
      \      '+': 'xclip -selection clipboard',
      \      '*': 'xclip -selection primary',
      \    },
      \   'paste': {
      \      '+': 'xclip -selection clipboard -o',
      \      '*': 'xclip -selection primary -o',
      \   },
      \   'cache_enabled': 1,
      \ }

" Esto hace que 'y' use el portapapeles del sistema directamente
set clipboard=unnamedplus
" Restablecer el cursor a línea al salir de Neovim
autocmd VimLeave * set guicursor=a:ver25

" n = normal, v = visual, i = insert
" ver25 significa barra vertical al 25% de ancho (una línea)
"set guicursor=n:block,v:ver25,i:ver25

"set guicursor=n:block,v:ver25,i:ver25,c:ver25
