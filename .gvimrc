colorscheme wombat        
"colorscheme murphy
colorscheme pablo
"colorscheme dante
set shortmess=a
set cmdheight=2
sy on
hi CursorLine guibg=red guifg=black 
hi CursorColumn guibg=red guifg=black 
"hi CursorLine guibg=red guifg=yellow
"hi CursorColumn guibg=red guifg=yellow
set gcr=a:block-blinkoff0

set noswapfile  " disable swapfile

"set gfn=Liberation\ Mono\ Regular\ 9
"set gfn=Monospace\ Regular\ 9
"set gfn=Inconsolata\ Medium\ 10
set gfn=Inconsolata\ Bold\ 10

"set gfn=Inconsolata\ Bold\ 9
"set gfn=Inconsolata\ Regular\ 8
"set gfn=DejaVu\ Sans\ Mono\ Bold\ 8
"set gfn=DejaVu\ Sans\ Mono\ Medium\ 9
"set guifont=Anonymous\ Pro\ 10
"set guifont=Anonymous\ Pro\ 9
"set guifont=Fantasque\ Sans\ Mono\ Regular\ 9
"set gfn=DejaVu\ Sans\ Mono\ Book\ 9
"set guifont=DejaVu\ Sans\ Mono\ 10
"set guifont=DejaVu\ Sans\ Mono\ 9
"set gfn=Fira\ Mono\ Regular\ 9
"set gfn=Fira\ Mono\ Regular\ 8
"set gfn=Liberation\ Mono\ Regular\ 9
"set gfn=FreeMono\ Bold\ 9
"set gfn=Nimbus\ Mono\ PS\ Regular\ 9
"set gfn=Nimbus\ Mono\ PS\ Bold\ 9
"set gfn=Monospace\ Regular\ 9
"set guifont=Consolas:h11:cDEFAULT


hi Folded guibg=black guifg=grey
"hi FoldColumn guibg=darkgrey guifg=white

" NERDTree setting defaults to work around http://github.com/scrooloose/nerdtree/issues/489
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
"let g:NERDTreeNodeDelimiter = '     ▸'
let g:NERDTreeNodeDelimiter = "\u00a0"
