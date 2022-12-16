source ~/.vim-vundle

"au GUIEnter * simalt ~x "x on an English Windows version. n on a French one

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
sy on
"sy off
"syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme darkblue      " set colorscheme
"colorscheme wombat        " set colorscheme
"colorscheme clarity       " set colorscheme
colorscheme default       " set colorscheme
"colorscheme molokai
"set guifont=Consolas:h11:cDEFAULT
hi CursorLine   cterm=underline  guibg=darkred guifg=white
"hi CursorLine   cterm=NONE ctermbg=darkred   ctermfg=black   guibg=darkred guifg=white
"hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=black   guibg=darkred guifg=white
hi CursorColumn cterm=None ctermbg=darkred   ctermfg=yellow  guibg=darkred guifg=white
hi MatchParen cterm=none ctermbg=red ctermfg=white
hi Folded guibg=black guifg=grey
hi FoldColumn guibg=darkgrey guifg=white
hi Search cterm=NONE ctermfg=black ctermbg=darkred
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set visualbell
set noswapfile  " disable swapfile

set tags=./tags;

let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     

filetype on
filetype plugin on

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch
"hi Search guibg=peru guifg=wheat
"hi Search cterm=NONE ctermfg=grey ctermbg=black
set cursorline
"set cursorcolumn

hi Visual ctermfg=yellow ctermbg=darkred guifg=#000000 guibg=#FFFFFF gui=none

nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

map <F4>  :call FileSwitchName()<ENTER>
map <F5>  :!cscope -b<CR>:cs reset<CR><CR>
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

map <F10> :cprev<ENTER>
map <F12> :cnext<ENTER>
map <F7>  :execute "vimgrep /" . expand("<cword>") . "/j **/*.h **/.hpp **/.hxx **/*.c **/*.cxx **/*.cpp **/*.cc" <Bar> cw<CR>

"tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" line/column highlighting (\l \c)
"nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader>l :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<CR>
nnoremap <silent> <Leader>L :call clearmatches()<CR>
nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>

"easytags, asynchronous tags update
"let g:easytags_async=1

" [gvim] toggle menu/tool/scroll bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
set go-=m
set go-=T


"execute pathogen#infect()
"filetype plugin indent on
"
""clang complete
"let g:clang_auto_select=1
"let g:clang_complete_auto=0
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1
"let g:clang_periodic_quickfix=0
"let g:clang_snippets=1
"let g:clang_snippets_engine="clang_complete"
"let g:clang_conceal_snippets=1
"let g:clang_exec="clang"
"let g:clang_user_options=""
"let g:clang_auto_user_options="path, .clang_complete"
"let g:clang_use_library=1
"let g:clang_library_path="/directory/of/libclang.so/"
"let g:clang_sort_algo="priority"
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
"nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
"
"let g:clic_filename="/path/to/index.db"
"nnoremap <Leader>r :call ClangGetReferences()<CR>
"nnoremap <Leader>d :call ClangGetDeclarations()<CR>
"nnoremap <Leader>s :call ClangGetSubclasses()<CR>
"

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
let temp = @@
norm! gvy
let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

function! Find(name)
    let l:list=system("find . -name '".a:name."' | grep -v \".svn/\" | perl -ne 'print \"$.\\t$_\"'")
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1 
        echo "'".a:name."' not found"
        return
    endif
    if l:num != 1
        echo l:list
        let l:input=input("Which ? (CR=nothing)\n")
        if strlen(l:input)==0
            return
        endif
        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
            echo "Not a number"
            return
        endif
        if l:input<1 || l:input>l:num
            echo "Out of range"
            return
        endif
        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
    else
        let l:line=l:list
    endif
    let l:line=substitute(l:line, "^[^\t]*\t./", "", "") 
    execute ":e ".l:line
endfunction

" Find file in specified path
function! FindP(path,name)
    let l:list=system("find ".a:path." -name '".a:name."' | grep -ev \"\.(git|svn)/\" | perl -ne 'print \"$.\\t$_\"'")
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1 
        echo "'".a:name."' not found"
        return
    endif
    if l:num != 1
        echo l:list
        let l:input=input("Which ? (CR=nothing)\n")
        if strlen(l:input)==0
            return
        endif
        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
            echo "Not a number"
            return
        endif
        if l:input<1 || l:input>l:num
            echo "Out of range"
            return
        endif
        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
    else
        let l:line=l:list
    endif
    let l:line=substitute(l:line, "^[^\t]*\t./", "", "") 
    execute ":e ".l:line

endfunction

command! -nargs=1 Find :call Find("<args>")
command! -nargs=1 FindP :call FindP("<args>")

