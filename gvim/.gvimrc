" Нельзя закрыть вим с помощью команд :q и :bd в графическом режиме
nnoremap :q :bd <CR>

set iskeyword+=-
set novisualbell
set linespace=3

"set guifont=Iosevka\ 18
"set guifont=Monocraft\ 18
set guifont=Iosevka\ 18

" Скрыть правый скролл
set guioptions-=r

" Скрыть тулбар
set guioptions-=T

" Скрыть меню
set guioptions-=m

nnoremap <A-r> :call RelatedGui()<cr>
nnoremap <A-к> :call RelatedGui()<cr>
