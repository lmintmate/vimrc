" set nocompatible

syntax on

filetype plugin indent on

let mapleader="\<Space>"

augroup myautocmds
    autocmd!
augroup END

if executable('git')

if has("unix")
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
endif

if has('win32')
    let $MYPLUGDIRECTORY = "~/vimfiles/plugins"
else
    let $MYPLUGDIRECTORY = "~/.vim/plugins"
endif

call plug#begin($MYPLUGDIRECTORY)

" Declare the list of plugins.
" dependency of vim-textobj-entire
Plug 'kana/vim-textobj-user'
" provides the text object ae for the entire buffer, ie for the entire buffer except leading and trailing empty lines
Plug 'kana/vim-textobj-entire'

" simple plugin to view list of recently opened files.
Plug 'lmintmate/MRU'

" shows number of search results
Plug 'google/vim-searchindex'

" disables search highlighting when you are done searching and re-enables it when you search again
Plug 'romainl/vim-cool'

" Autocomplete system for the cmdline
Plug 'paradigm/SkyBison'

" Makes the yanked region apparent
Plug 'machakann/vim-highlightedyank'

Plug 'kshenoy/vim-signature'

Plug 'itchyny/vim-highlighturl'

Plug 'lmintmate/ShowMotion'

Plug 'jszakmeister/vim-togglecursor'

Plug 'sunaku/vim-modusline'

Plug 'masukomi/vim-markdown-folding', { 'for': 'markdown' }

Plug 'pbrisbin/vim-rename-file'

Plug 'amadeus/vim-convert-color-to'

Plug 'dahu/lisper-vim'

Plug 'itchyny/vim-gitbranch'

Plug 'niklaas/lightline-gitdiff'

Plug 'axvr/org.vim'

Plug 'lacygoill/vim-freekeys'

Plug 'inkarkat/SyntaxAttr.vim'

" Initialize plugin system
call plug#end()
endif

" SkyBison keymaps
" general
nnoremap <silent> <leader>s :<c-u>call SkyBison("")<cr>
"for buffers
nnoremap <silent> <leader>b :<c-u>call SkyBison("b ")<cr>
" for help
nnoremap <silent> <leader>h :<c-u>call SkyBison("h ")<cr>
" for file finding
nnoremap <silent> <leader>e :<c-u>call SkyBison("e ")<cr>

" SkyBison substring matching
let g:skybison_fuzz = 2

" MRU shortcut
nnoremap <silent> <leader>r :MRU<cr>

" duration of highlightedyank highlight in milliseconds
let g:highlightedyank_highlight_duration = 590

let g:SignatureMarkTextHL = "Title"

let g:highlighturl_guifg ='#00ffff'

if exists('g:loaded_highlighturl')
let g:highlighturl_enable = 0
	augroup highlighturl-filetype
	  autocmd!
	  autocmd FileType text call highlighturl#enable_local()
augroup END
endif

autocmd myautocmds VimEnter * call s:showmotion_bindings()
function! s:showmotion_bindings() abort
if exists('g:loaded_showmotion')
"*** Only highlights motions corresponding to the one you typed
nmap w <Plug>(show-motion-w)
nmap W <Plug>(show-motion-W)
nmap b <Plug>(show-motion-b)
nmap B <Plug>(show-motion-B)
nmap e <Plug>(show-motion-e)
nmap E <Plug>(show-motion-E)
nmap ge <Plug>(show-motion-ge)
nmap gE <Plug>(show-motion-gE)
"Show motion for chars:
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap ; <Plug>(show-motion-;)
nmap , <Plug>(show-motion-,)
endif
endfunction

autocmd myautocmds ColorScheme *
        \ hi User1 guifg=#000000 guibg=#7fff00 |
        \ hi User2 guifg=#000000 guibg=#ffd700 |
        \ hi User3 guifg=#000000 guibg=#ff6347

autocmd myautocmds VimEnter * call s:customize_modusline()
function! s:customize_modusline() abort
if exists('g:loaded_modusline')
  " do your customization here, inside this function
  let g:modusline_colors['i'] = '%#User1#'
  let g:modusline_colors['v'] = '%#User2#'
  let g:modusline_colors['V'] = '%#User2#'
  let g:modusline_colors["\<C-V>"] = '%#User2#'
  let g:modusline_colors['R'] = '%#User3#'
  let g:modusline_colors['Rv'] = '%#User3#'
  let g:modusline_colors['t'] = '%#StatusLineTerm#'
endif  
endfunction

nnoremap <silent> <leader>c :<c-u>call ConvertColorTo("hex ")<cr>

let g:lightline#gitdiff#indicator_added = '+'
let g:lightline#gitdiff#indicator_deleted = '-'
let g:lightline#gitdiff#indicator_modified = '≠'

nnoremap <silent> <leader>a :<c-u>call SyntaxAttr#SyntaxAttr()<cr>

if has('termguicolors')
set termguicolors
endif

autocmd myautocmds ColorScheme slate
        \ hi! link PreProc Identifier

if has('gui_running') || has('termguicolors')
try
    colorscheme blue-mood
catch
    colorscheme slate
endtry
else
colorscheme slate
endif

autocmd myautocmds FileType markdown hi link markdownError NONE

if has("win32")
    set guifont=DejaVu_Sans_Mono:h14,Consolas:h14
else
    set guifont=DejaVu\ Sans\ Mono\ 14
endif

set linespace=2

set guioptions-=T       " disable toolbar in Gvim

set guioptions-=e " Don't use gui tabline

set guioptions+=c       " disable gui dialogs in Gvim for simple choices

" hide menubar
nnoremap <silent> <F9> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
" hide scrollbar
nnoremap <silent> <F10> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

set wildmenu            " visual autocomplete for command menu

set wildmode=longest:full,full

set showcmd             " display incomplete commands

set shortmess+=I        " prevents the initial message from showing up

set linebreak           " prevents wrap mode from cutting words in the middle

set relativenumber      " set relative line numbers

set scrolloff=4         " set number of context lines to show above/below cursor

set confirm             " ask for confirmation on operations

set clipboard=unnamed,unnamedplus " set vim to use the system clipboard

set hidden " switch to another buffer without asking for confirmation to save any unsaved changes

set belloff=all " disable beeping

set display=lastline " display partial lines at the bottom of the screen

set encoding=utf-8

set backspace=indent,eol,start

set mouse=a

nnoremap <CR> O<Esc>j

nnoremap x "_x
nnoremap X "_X

" don't copy to the clipboard the stuff I replace by pasting
vnoremap p "_dp
vnoremap P "_dP

nnoremap <Up> gk
nnoremap <Down> gj

if has('gui_running')
nnoremap <silent> <c-s> :update<CR>
endif

if has("win32")
silent! vunmap <C-X>
endif

set nrformats+=alpha

let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro nobl'

function! s:helptab()
  if &buftype == 'help'
    silent! :only
    nnoremap <silent> <buffer> q :bdelete<cr>
  endif
endfunction
autocmd myautocmds BufWinEnter *.txt call s:helptab()

set incsearch " display search matches as characters are entered

set hlsearch " highlight matches

set ignorecase          " case-insensitive search

set smartcase " override the previous when search pattern uses capitals e.g. /Foo finds only Foo

set laststatus=2 " always show status line
" beginning of statusline
set statusline=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " encoding
set statusline+=\(%{&fileformat}\) " file format
set statusline+=\ %t " name of file in the buffer
set statusline+=%m " modified flag
set statusline+=%h " help buffer flag
set statusline+=%r " read-only flag
set statusline+=\ %{exists('g:loaded_gitbranch')?gitbranch#name():''}
set statusline+=\ %{exists('g:lightline#gitdiff#cache')?lightline#gitdiff#get():''}
set statusline+=%=
set statusline+=\ %k " keymap
set statusline+=\ %y " filetype
set statusline+=\ L%l " current line
set statusline+=\ %p%% " percentage into file
set statusline+=\ %{strftime(\"%H:%M\")}
set statusline+=\ 
" end of statusline

set keymap=greek_utf-8  " enables greek input - switch inputs with ctrl+6

set iminsert=0 " I dont want greek as default though in insert mode

set imsearch=-1 " with this when searching it inherits the keymap currently used in insert mode

map α a
map Α A
map β b
map Β B
map γ g
map Γ G
map δ d
map Δ D
map ε e
map Ε E
map ζ z
map Ζ Z
map η h
map Η H
map θ u
map Θ U
map ι i
map Ι I
map κ k
map λ l
map Λ L
map μ m
map Μ M
map ν n
map Ν N
map ξ j
map Ξ J
map ο o
map Ο O
map π p
map Π P
map ρ r
map Ρ R
map σ s
map ς w
map τ t
map Τ T
map υ y
map φ f
map Φ F
map χ x
map ψ c
map ω v
map Ω V
map γγ gg
map αε ae
