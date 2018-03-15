set nocompatible        " no compatibility with vi
set termguicolors       " makes terminal vim compatible with gui themes
colorscheme blue-mood   " where I enable my home-made colorscheme
set guifont=DejaVu\ Sans\ Mono\ 14 " font for Gvim
set wildmenu            " visual autocomplete for command menu
set incsearch           " display search matches as characters are entered
set hlsearch            " highlight matches
set showcmd             " display incomplete commands
set keymap=greek_utf-8  " enables greek input - switch inputs with ctrl+6
set iminsert=0          " I dont want greek as default though in insert mode
set imsearch=-1         " with this when searching it inherits the keymap currently used in insert mode
set shortmess+=I        " prevents the initial message from showing up
set linebreak           " prevents wrap mode from cutting words in the middle
set relativenumber      " set relative line numbers to ease navigation by lines - toggle with :set rnu!
set scrolloff=4         " set number of context lines to show above/below cursor
nnoremap <silent> <esc> :noh<cr><esc> " clear the highlighting from the previous search when pressing esc
set clipboard=unnamedplus " set vim to use the system clipboard for cutting and pasting on Linux
nnoremap x "_x " delete letters without putting them in the clipboard
set belloff=all " disable beeping
" map Greek letters to the respective on the keyboard Latin ones - for Normal, Visual, Select and Operator pending modes - in case I've forgotten to switch my system keyboard language from Greek - idea from https://www.void.gr/kargig/dot/vimrc
map ι i
map Ι I
map δ d
map Δ D
map η h
map ξ j
map κ k
map λ l
map ς w
map ε e
map π p
map υ y
map χ x
map σ s
map ν n
map ζ z
map φ f
map β b
map ρ r
map Ρ R
map ο o
map Ο O
map α a
map Α A
map θ u
map Θ U
map ψ c
" tip for Greek spell-checking: write in the file you want to spellcheck :setlocal spell spelllang=el, and it will download all necessary files and do the spellchecking by itself (tip from https://forum.ubuntu-gr.org/viewtopic.php?f=23&t=18008)
