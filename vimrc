" General settings "
set grepprg=ag
set shell=bash\ --login

" Make message bar taller to avoid 'press enter' prompt
set shortmess=a
set cmdheight=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Of course
set nocompatible
if has('autocmd')
  filetype indent plugin on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" summon CtrlP with <space>+f
let g:ctrlp_map = '<leader>p'
set runtimepath^=~/.vim/bundle/ctrlp.vim
if executable('ag')
  " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

   " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" set location of help files
if filereadable(expand("~/.vim/doc"))
  helptags ~/.vim/doc
endif

""" LINE NUMBERING
set number
set numberwidth=1
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

""" CURSOR
" iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" " tmux
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" These could use some annotating
set hlsearch
set bs=2
set ai
set ruler
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
" set t_Co=256

" Change status line color to show mode
" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Red
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif


""" Show EasyBuffer
nmap <C-B> :EasyBuffer<CR>


""" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

" associate *.foo with filetype bar
au BufRead,BufNewFile *.jison setfiletype javascript

""" Color column only where text overflows
set textwidth=100
set colorcolumn=+0
call matchadd('ColorColumn', '\%81v', 100)


""" runtime plugin/dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" " Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" " matchit -- for matching block delimiters
runtime macros/matchit.vim

" " omnicomplete
set omnifunc=syntaxcomplete#Complete

" " Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Copy And Paste
nmap _a ggVG      " Select all text in file
vmap <C-c> "*y      " Copy to system clipboard
vmap <C-x> "*d      " Cut to system clipboard

" Paste from system clipboard
map <silent><C-p> :set paste<CR>i<ESC>"+p:set nopaste<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Thoughtbot Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" map leader to space
let mapleader=" "

" vim-rspec settings
map <Leader>a :call RunAllSpecs()<CR>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Automatically :write before running commands
set autowrite

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Automatic resize of windows.
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Code Folding Logic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax " Enable folding based on syntax rules
let ruby_fold=1
set foldlevelstart=1
" Set a nicer foldtext function
if has("folding")
  set foldtext=MyFoldText()
  function! MyFoldText()
    " for now, just don't try if version isn't 7 or higher
    if v:version < 701
      return foldtext()
    endif
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
    if &fdm=='diff'
      let l:linetext=''
      let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
      let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
      " note trailing space on next line
      setlocal fillchars+=fold:\
    elseif !exists('b:foldpat') || b:foldpat==0
      let l:foldtext = ' '.(v:foldend-v:foldstart).' lines folded'.v:folddashes.'|'
      let l:endofline = (&textwidth>0 ? &textwidth : 80)
      let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
      let l:align = l:endofline-strlen(l:linetext)
      setlocal fillchars+=fold":-
    elseif b:foldpat==1
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
      let l:foldtext = ' '.v:folddashes
      let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
      let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' lines--- '
      let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
      let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
      let l:align -= strlen(l:linetext)
      setlocal fillchars+=fold:-
    endif
    return printf('%s%*s', l:linetext, l:align, l:foldtext)
  endfunction
endif

highlight Folded gui=italic   guifg=black   guibg=#3467ff
highlight Folded cterm=italic ctermfg=black ctermbg=110

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Open NERDTree with ctrl+n
map <Leader>n :NERDTreeToggle<CR>

""" Have NERDTree and CtrlP play nice together
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

let NERDTreeShowHidden=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Notes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:notes_directories = ['~/Dropbox/shared-notes']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Text search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep for the word under the cursor, open results in quickfix pane
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Grep with given arguments, open results in quickfix pane
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>\ :Ag<SPACE>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" My Own Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" map escape to jj
:imap jj <Esc>

"" undo branching with gundo
nnoremap <C-z> :GundoToggle<CR>

"" Erase Bad Whitespace
nnoremap <Leader>kw :EraseBadWhitespace<CR>

"" map to emacs end of line and beginning of line
nnoremap <C-e> <S-a><Esc>
nnoremap <C-a> <S-i><Esc>

"" Select all text in a file
nnoremap <Leader>a ggVg

"" Copy to system clipboard
set clipboard=unnamed

"" Dash mappng
nnoremap _d :Dash<CR>

"" Git fugitive mapping
nnoremap ,g :Git

let g:syntastic_check_on_open = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'

"" highlight mapping
nnoremap <silent><CR> :noh<CR><CR>

" Toggle relative and absolute numbering
function! NumberToggle()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
  endif
    set number
endfunction

" Toggle numbering style with ctrl+m
nnoremap <silent><Leader>m :call NumberToggle()<CR>

"" COLORS
syntax on
set background=dark
colorscheme base16-default
