filetype off                   " required!

set gfn=Input\ Mono\ Condensed\ Regular\ 14
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" Bundle 'gmarik/vundle'
" Bundle 'Valloric/YouCompleteMe'
execute pathogen#infect()
set background=light
let g:solarized_contrast='high'
colorscheme solarized
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

filetype plugin indent on

set backspace=indent,eol,start
highlight clear SignColumn
"set gfn=DejaVu\ Sans\ Mono\ 14
" set gfn=PT\ Mono\ 16
"set gfn=Cousine\ Regular\ 14
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
" установить шрифт Courier New Cyr
" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
set iskeyword=@,48-57,_,192-255
set t_Co=256
"colorscheme summerfruit256



set fileencodings=utf-8,cp1251,koi8-r,default

"set enc=cp1251

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7
set novisualbell
set  t_vb=".
set hidden
set guioptions-=T
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
set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" hi OverLength ctermbg=darkred ctermfg=white guibg=#592929
" match OverLength /\%81v.*/

"set enc=cp1251
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

imap <F1> <C-^>
call SMap("<F2>", ":bd<cr>")
call SMap("<F12>", ":quit<cr>")
call SMap("<F3>", "0f{mf%ms'fV's<jV'sk>/function")
call SMap("<C-J>", "<C-W>j")
call SMap("<C-K>", "<C-W>k")
syntax on
au BufNewFile,BufRead *.t2t                 setf txt2tags
noremap <silent> <F11> :cal VimCommanderToggle()<CR>
imap <C-?> <C-H>

" syn match ErrorMsg '\%>80v.+'
" :au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
set exrc
set secure
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>


nnoremap <Leader>s !sort<CR>
nnoremap <silent> <Leader>l
	\ :if exists('w:long_line_match') <Bar>
	\   silent! call matchdelete(w:long_line_match) <Bar>
	\   unlet w:long_line_match <Bar>
	\ elseif &textwidth > 0 <Bar>
	\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
	\ else <Bar>
	\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
	\ endif<CR>



let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 8
let s:maxfontsize = 19
let s:medfontsize = 12

function! SetNormalFontSize()
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
      let newfont = fontname . s:medfontsize
      let &guifont = newfont
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction



function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

command! W w

function! NormalFont()
  call SetNormalFontSize()
endfunction

function! GrepIText(text)
	exe ":0,$!grep -i '" . a:text . "'"
endfunction
command! -nargs=* Gi call GrepIText('<args>')


nnoremap :bdd :bufdo bd <CR>
"nnoremap <Leader>[ :SmallerFont <CR>
"nnoremap <Leader>] :LargerFont <CR>
nnoremap <Leader>f :call NormalFont() <CR>
nnoremap <Leader>p :!php -l %<CR>


" Automatically update copyright notice with current year
" autocmd BufWritePre *
  " \ if &modified |
  " \   exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
  " \ endif>

au BufRead,BufNewFile *nginx* set ft=nginx
au BufRead,BufNewFile *io set ft=io
set listchars=tab:··
"set list

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v]\ [LEN=%L]
filetype plugin indent on

for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

set guioptions-=T
set guioptions-=m
set mouse=
set noerrorbells visualbell t_vb=
set cino=(0

call SMap("<F8>", ":!aspell -c %<cr>")
" set nohlsearch


call SMap("<C-o>", ":r !xclip -o<cr>")
call SMap("<C-t>", "<esc><esc>ggO<esc>O<esc>ggO----------------------------<esc>:r !date <cr>o<esc>o")
" call SMap("<C-h>", "<esc><esc>ggO<esc>O<esc>ggO----------------------------<esc>gg2O<esc>")

au BufNewFile,BufRead *.less set filetype=less

map <S-Enter> O<Esc>j
map <CR> o<Esc>k
" imap <Esc> <Esc>:w<cr>
call SMap("<PageUp>", ":w<CR>")
filetype indent on

" autocmd FileType jade imap <Esc> <Esc>:w<cr>
" autocmd FileType stylus imap <Esc> <Esc>:w<cr>

" au BufRead,BufNewFile */wiki/* setfiletype markdown

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <C-f> <esc>ggVG!undoc<cr>

let g:vim_markdown_folding_disabled=1
let g:user_emmet_leader_key='<c-e>'

" swap files (.swp) in a common location
" // means use the file's full path
"set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
"set backup
"set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
" set undofile
" set undodir=~/.vim/_undo/
let g:user_emmet_expandabbr_key='<S-Tab>'
