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
" simple plugin to view list of recently opened files.
" I'm using my fork which combines the improvements from lilydjwg's fork with yegappan's upstream additions
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
" == END OF SECTION ==
" Plugin config
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
" Rest of config
set termguicolors       " makes terminal vim compatible with gui themes
colorscheme blue-mood   " where I enable my home-made colorscheme
" this disables the annoying red on things like underscores in markdown mode (from https://github.com/tpope/vim-markdown/issues/79)
autocmd FileType markdown hi link markdownError NONE
" font for Gvim - DejaVu Sans Mono on Unix, Lucida Console on Windows (because DejaVu might not be installed there)
if has("win32")
    set guifont=Lucida_Console:h14
else
    set guifont=DejaVu\ Sans\ Mono\ 14
endif
set linespace=2         " increases space between lines - fixes underscore not showing up in Gvim
set wildmenu            " visual autocomplete for command menu
set incsearch           " display search matches as characters are entered
set hlsearch            " highlight matches
set ignorecase          " case-insensitive search e.g. if I want to find Foo as well when searching for /foo
set smartcase           " override the previous when search pattern uses capitals e.g. /Foo finds only Foo
set showcmd             " display incomplete commands
set keymap=greek_utf-8  " enables greek input - switch inputs with ctrl+6
set iminsert=0          " I dont want greek as default though in insert mode
set imsearch=-1         " with this when searching it inherits the keymap currently used in insert mode
set shortmess+=I        " prevents the initial message from showing up
set linebreak           " prevents wrap mode from cutting words in the middle
set relativenumber      " set relative line numbers to ease navigation by lines - toggle with :set rnu!
set scrolloff=4         " set number of context lines to show above/below cursor
set confirm             " ask for confirmation on operations such as quit without saving
set guioptions-=T       " disable toolbar in Gvim
set guioptions+=c       " disable gui dialogs in Gvim for simple choices
nnoremap <CR> o<Esc>k " have Enter add a new line below the current one without entering insert mode
set clipboard=unnamedplus " set vim to use the system clipboard for cutting and pasting
set hidden              " switch to another buffer without asking for confirmation to save any unsaved changes
set laststatus=2        " always show status line
" custom statusline - I was tempted to use lightline, but then noticed that, because it needs separate theming, would look out of place with my home-made theme
" Place to get started with the subject: https://shapeshed.com/vim-statuslines/
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
nnoremap x "_x " delete letters without putting them in the clipboard
set belloff=all " disable beeping
set display=lastline " display partial lines at the bottom of the screen (instead of not doing so)
vnoremap p "_dp
vnoremap P "_dP " don't copy to the clipboard the stuff I replace by pasting (from https://stackoverflow.com/a/10723838)
" I sometimes want to be able to move by visual lines, and rebinding j and k to gj and gk broke prefixing j and k with numbers, so I bound these commands to the arrows which aren't used with a prefix (if at all) anyways
nnoremap <Up> gk
nnoremap <Down> gj
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
" tip for Greek spell-checking: write in the file you want to spellcheck :setlocal spell spelllang=el, and it will download all necessary files and do the spellchecking by itself (tip from https://forum.ubuntu-gr.org/viewtopic.php?f=23&t=18008)
