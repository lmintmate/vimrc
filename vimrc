" set nocompatible

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

" simple plugin to view list of recently opened files.
Plug 'lmintmate/MRU'

" shows number of search results
Plug 'google/vim-searchindex'

" disables search highlighting when you are done searching and re-enables it when you search again
Plug 'romainl/vim-cool'

" Emmet - expandable abbreviations to ease writing html and css
Plug 'mattn/emmet-vim'

" Autocomplete system for the cmdline
Plug 'paradigm/SkyBison'

" Makes the yanked region apparent
Plug 'machakann/vim-highlightedyank'

" Initialize plugin system
call plug#end()

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

set termguicolors

colorscheme blue-mood

autocmd FileType markdown hi link markdownError NONE

if has("win32")
    set guifont=Lucida_Console:h14
else
    set guifont=DejaVu\ Sans\ Mono\ 14
endif

set linespace=2

set guioptions-=T       " disable toolbar in Gvim

set guioptions+=c       " disable gui dialogs in Gvim for simple choices

set wildmenu            " visual autocomplete for command menu

set showcmd             " display incomplete commands

set shortmess+=I        " prevents the initial message from showing up

set linebreak           " prevents wrap mode from cutting words in the middle

set relativenumber      " set relative line numbers

set scrolloff=4         " set number of context lines to show above/below cursor

set confirm             " ask for confirmation on operations

set clipboard=unnamedplus " set vim to use the system clipboard

set hidden              " switch to another buffer without asking for confirmation to save any unsaved changes

set belloff=all " disable beeping

set display=lastline " display partial lines at the bottom of the screen

nnoremap <CR> o<Esc>k " have Enter add a new line below the current one without entering insert mode

nnoremap x "_x " delete letters without putting them in the clipboard

vnoremap p "_dp
vnoremap P "_dP " don't copy to the clipboard the stuff I replace by pasting

nnoremap <Up> gk
nnoremap <Down> gj

set incsearch           " display search matches as characters are entered

set hlsearch            " highlight matches

set ignorecase          " case-insensitive search

set smartcase           " override the previous when search pattern uses capitals e.g. /Foo finds only Foo

set laststatus=2        " always show status line
" beginning of statusline
set statusline=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " encoding
set statusline+=\(%{&fileformat}\) " file format
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
" end of statusline

set keymap=greek_utf-8  " enables greek input - switch inputs with ctrl+6

set iminsert=0          " I dont want greek as default though in insert mode

set imsearch=-1         " with this when searching it inherits the keymap currently used in insert mode

" map Greek letters to the respective on the keyboard Latin ones - for Normal, Visual, Select and Operator pending modes - in case I've forgotten to switch my system keyboard language from Greek - idea from https://www.void.gr/kargig/dot/vimrc
map α a
map Α A
map β b
map γ g
map Γ G
map δ d
map Δ D
map ε e
map ζ z
map η h
map Η H
map θ u
map Θ U
map ι i
map Ι I
map κ k
map λ l
map Λ L
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
