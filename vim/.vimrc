" Подключаем все модули что есть для вима
execute pathogen#infect()

" Настраиваем шрифт
"set gfn=Input\ Mono\ Condensed\ Regular\ 14

" Настройки цветовой схемы
set t_Co=256
colorscheme xoria256
set modeline
"colorscheme seagull

" Возможность использовать часть команд в русской раскладке
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

" Включаем поддержку плагинов и отступов
filetype plugin indent on


" Включаем нумерацию строк
set nu

" установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set keymap=russian-jcukenwin
" по умолчанию - латинская раскладка
set iminsert=0

" по умолчанию - латинская раскладка при поиске
set imsearch=0

" игнорировать регистр при поиске
set ic

" подсвечивать поиск
set hls

" использовать инкрементальный поиск
set is

" ширина текста
set textwidth=0

" минимальная высота окна пусть будет 0 (по умолчанию - 1)
set winminheight=0

" всегда делать активное окно максимального размера
set noequalalways
set winheight=9999

set iskeyword=@,48-57,_,192-255
set t_Co=256


set backspace=indent,eol,start
highlight clear SignColumn

set fileencodings=utf-8,cp1251,koi8-r,utf-16le,default

"set enc=cp1251

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7
set novisualbell
set  t_vb=".
set hidden
set ch=1
set autoindent
" Преобразование Таба в пробелы
set expandtab
" задать размер табуляции в четыре пробела

" Размер табулации по умолчанию
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&fileencoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
"set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

set sessionoptions=blank,buffers,curdir,help,resize,tabpages,winsize


" hi OverLength ctermbg=darkred ctermfg=white guibg=#592929
" match OverLength /\%81v.*/

function SMap(key, action, ...)
    let modes = " vi"
    if (a:0 > 0)
        let modes = a:{1}
    endif
    if (match(modes, '\Ii') != -1)
        execute 'imap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Nn') != -1)
        execute 'nmap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, ' ') != -1)
        execute 'map ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Vv') != -1)
        execute 'vmap ' . a:key . ' <Esc>' . a:action
    endif
endfunction

" Ctrl-jk переходять по складкам
call SMap("<C-J>", "<C-W>j")
call SMap("<C-K>", "<C-W>k")
call SMap("<C-о>", "<C-W>j")
call SMap("<C-л>", "<C-W>k")

syntax on

set exrc
set secure
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :noh <CR>


command! W w

au BufRead,BufNewFile *nginx* set ft=nginx
au BufRead,BufNewFile *io set ft=io

" set listchars=tab:··
"set list


" Выключаем стрелки в виме
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

set mouse=
set noerrorbells visualbell t_vb=
set cino=(0



" Ctrl-f открывает поиск по файлам

au BufNewFile,BufRead *.less set filetype=less

" Вставка пустых строк выше и ниже курсора
map <S-Enter> O<Esc>j
map <CR> o<Esc>k


" Сочетания alt-j|k передвигают строки вверх и вниз
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap Y :!xc<CR>

" Еммет раскрывает свои шорткаты по сочетанию shift-tab
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_expandabbr_key='<S-Tab>'
" -------------------------------------------


" Сворачивание кода включено на основе отступов
set fdm=indent

" -------------------------------------------
" Команда gb открывает ссылку под курсором в браузере
" Консольная команда br - открывает ссылку в хроме и меняет фокус
" оконного менеджера на рабочий стол с браузером
"let g:Browser_x = 'br'
"nnoremap <silent> gb :exe('!'.g:Browser_x.' "'.expand('<cfile>').'" &')<CR>
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!br '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap <silent> gb :call HandleURL()<cr>
" -------------------------------------------

" Отключить автодополнение html, javascript для php
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'
" -------------------------------------------

" заставить вим сохранять по команде :ц
cnoreabbrev <expr> ц ((getcmdtype() is# ':' && getcmdline() is# 'ц')?('w'):('ц'))
" -------------------------------------------
" Команда для закрытия всех буфферов
nnoremap :bdd :bufdo bd <CR>

" -------------------------------------------
" Настройки библиотеки проверки синтаксиса
" отображает количество ошибок в статусной строке
set statusline+=%#warningmsg#
set statusline+=%*

" Включаем проверку правописания
set spelllang=ru,en
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
"let g:phpfmt_php_path = "/opt/php/bin/php"               " Path to PHP
let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)

let g:phpfmt_on_save = 0
let g:phpfmt_update_on_open = 0


let g:formatters_javascript = [ 'jscs' ]
"au BufWrite *.js :Autoformat

" Главы в маркдаун файлах сворачиваются
let g:vim_markdown_folding_disabled = 0

set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
let g:fixmyjs_engine = 'eslint'
noremap <Leader><Leader>f :Fixmyjs<CR>
let g:fixmyjs_rc_path = '$HOME/.eslintrc.json'
au BufRead,BufNewFile *.ntl set filetype=javascript
au BufRead,BufNewFile *.dbj set filetype=javascript
au BufRead,BufNewFile *.nip set filetype=javascript
nmap <Leader>n "=system('nn')<C-M>p
nmap <Leader>l :ALENextWrap<CR>
autocmd FileType javascript set formatprg=efx

let g:ale_linters = {
\   'javascript': ['eslint'],
\}


autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
"autocmd BufRead *.md setlocal spell
autocmd BufRead plan.md setlocal nospell
autocmd BufNewFile * :exe ': !mkdir -p ' . escape(fnamemodify(bufname('%'),':p:h'),'#% \\')

command! MakeTags !ctags -R .


" Показывать введённую команду
set showcmd

" Строки нумеровать относительно курсора
"set relativenumber
set wildmenu

" Отключить фолдинг
set nofoldenable

" let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"
" let g:php_cs_fixer_php_path = "php"               " Path to PHP
" let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
" let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
" let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

" Раскрасить 81 колонку в красный цвет
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)
" set colorcolumn=81

highlight clear SignColumn

nnoremap <Leader>d :put=strftime('### %F ')<CR>
map <leader>gf :e <cfile><cr>
nnoremap <Leader>s ggVG:!fmts<CR>
nnoremap <Leader>yc "*yi`

" Синтаксис для конфигов nginx
autocmd BufRead,BufNewFile *nginx/conf.d/* set syntax=nginx
autocmd BufRead,BufNewFile *sites-available/* set syntax=nginx
autocmd BufRead,BufNewFile *sites-available/* set syntax=nginx
autocmd BufRead,BufNewFile *sites-enabled/* set syntax=nginx
autocmd BufRead,BufNewFile *nginx/conf/* set syntax=nginx
autocmd BufRead,BufNewFile *nginx/snippets/* set syntax=nginx
autocmd BufRead,BufNewFile nginx.conf set syntax=nginx
autocmd BufRead,BufNewFile nginx-*.conf set syntax=nginx
autocmd BufRead,BufNewFile dunstrc set syntax=config
autocmd BufRead,BufNewFile userparameter_* set syntax=config
autocmd BufRead,BufNewFile *i3status* set syntax=i3


let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'
let g:ale_completion_enabled = 1

" .vimrc
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}
autocmd FileType vue syntax sync fromstart

let g:ale_fixers = {'javascript.jsx': ['prettier'], 'typescript': [], 'yaml': ['prettier'], 'javascript': ['prettier'], 'typescript.tsx': []}
" let g:ale_fix_on_save = 1
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Если файл менялся извне - перезагрузить его
set autoread

let g:snipMate = { 'snippet_version' : 1 }

set rtp+=~/.fzf
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'checkbox': { 'toggles': [' ', '+'] },
                        \ 'map': { 'prefix': '<leader>' },
                        \ 'links': { 'fragment': { 'complete': 0 }, 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Оглавление', 'update_on_write': 1 } }

"\ 'fold': { 'enable': 1 }
                        "\ 'enter': { 'shift': 1 },
let g:polyglot_disabled = ['markdown']

"call ale#Set('php_phpcs_options', '--standard=/home/bubujka/.db/wiki/bubujka-code-standard.xml')
call ale#Set('php_phpcs_options', '--standard=PSR2')

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>




call SMap("<C-f>", "<esc><esc>:FZF<cr>")
call SMap("<C-c>", "<esc><esc>:r ! blade-component-wrapper <cr>")
call SMap("<Leader>c", "<esc><esc>:r ! blade-component-wrapper --full <cr>")
call SMap("<Leader>v", "<esc><esc>:r ! insert-vue-app-wrapper <cr>")
"call SMap("<C-x>", "<esc><esc>:r ! blade-component-wrapper --full<cr>")
