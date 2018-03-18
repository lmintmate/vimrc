" set nocompatible        " no compatibility with vi - turns out this particular line is unecessary, as the help file informs that the compatible option is turned off if a vimrc file is found.
" == VIM PLUG SECTION ==
" autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins will be downloaded under the specified directory.
" download files on a different directory if on windows
if has("win32")
    call plug#begin('~/vimfiles/plugins')
else
    call plug#begin('~/.vim/plugins')
endif

" Declare the list of plugins.
" dependency of vim-textobj-entire
Plug 'kana/vim-textobj-user'
" provides the text object ae for the entire buffer, ie for the entire buffer except leading and trailing empty lines
Plug 'kana/vim-textobj-entire'
" simple plugin to view list of recently viewed files
Plug 'yegappan/MRU'

" Initialize plugin system
call plug#end()
" == END OF SECTION ==
" Rest of config
set termguicolors       " makes terminal vim compatible with gui themes
colorscheme blue-mood   " where I enable my home-made colorscheme
set guifont=DejaVu\ Sans\ Mono\ 14 " font for Gvim
set linespace=2         " increases space between lines - fixes underscore not showing up in Gvim
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
set confirm             " ask for confirmation on operations such as quit without saving
set guioptions+=c       " disable gui dialogs in Gvim for simple choices
nnoremap <silent> <backspace> :nohlsearch<cr><esc> " clear the highlighting from the previous search when pressing backspace
nnoremap <CR> o<Esc>k " have Enter add a new line below the current one without entering insert mode
set clipboard=unnamedplus " set vim to use the system clipboard for cutting and pasting
set hidden              " switch to another buffer without asking for confirmation to save any unsaved changes
set laststatus=2        " always show status line
" custom statusline - I was tempted to use lightline, but then noticed that, because it needs separate theming, would look out of place with my home-made theme
" Place to get started with the subject: https://shapeshed.com/vim-statuslines/
set statusline=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " encoding
set statusline+=\[%{&fileformat}\] " file format
set statusline+=\ %t " name of file in the buffer
set statusline+=%m " modified flag
set statusline+=%h " help buffer flag
set statusline+=%r " read-only flag
set statusline+=%=
set statusline+=\ %k " keymap
set statusline+=\ %y " filetype
set statusline+=\ L%l " current line
set statusline+=\ %p%% " percentage into file
set statusline+=\ 
nnoremap x "_x " delete letters without putting them in the clipboard
set belloff=all " disable beeping
vnoremap p "_dp
vnoremap P "_dP " don't copy to the clipboard the stuff I replace by pasting (from https://stackoverflow.com/a/10723838)
" map Greek letters to the respective on the keyboard Latin ones - for Normal, Visual, Select and Operator pending modes - in case I've forgotten to switch my system keyboard language from Greek - idea from https://www.void.gr/kargig/dot/vimrc
map ι i
map Ι I
map δ d
map Δ D
map η h
map ξ j
map Ξ J
map κ k
map λ l
map ς w
map ε e
map π p
map Π P
map υ y
map χ x
map σ s
map ν n
map Ν N
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
map Η H
map Μ M
map Λ L
map ω v
map Ω V
map γ g
map Γ G
map γγ gg
map αε ae
" tip for Greek spell-checking: write in the file you want to spellcheck :setlocal spell spelllang=el, and it will download all necessary files and do the spellchecking by itself (tip from https://forum.ubuntu-gr.org/viewtopic.php?f=23&t=18008)
