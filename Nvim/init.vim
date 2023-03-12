"PLUGINS INSTALLATION

call plug#begin('~/AppData/Local/nvim/plugged') 	"INSTALLATION DIRECTORY

"PLUGINS'S LIST

Plug 'Yggdroot/indentLine' 		                 "IDENTATION
Plug 'preservim/nerdtree'		                 "SIDE PANEL
Plug 'christoomey/vim-tmux-navigator'	         "NAVIGATION AMONG OPENED FILES
Plug 'jiangmiao/auto-pairs'		                 "BRACKETS AUTOCOMPLETE
Plug 'vim-airline/vim-airline'		             "STATUS BAR
Plug 'vim-airline/vim-airline-themes'	         "THEMES FOR VIM-AIRLINE

call plug#end() 			

"END OF PLUGIN'S LIST

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"LOCAL CONFIGURATIONS

:set number                                      "SHOW NUMBERS
:set mouse=a
:syntax enable
:set encoding=utf-8
:set nowrap
:set clipboard=unnamed
:set sw=2 				                         "IDENTATION BY 2
:set autoindent
:set relativenumber

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"NERDTREE CONFIG
:map <C-n> :NERDTreeToggle<CR>                                     "HOTKEY FOR NERDTREE (CTRL + N)

"VIM-AIRLINE CONFIG
let g:airline#extensions#tabline#enabled = 1	                   "SHOWS THE TAB LINE IN WHICH WE ARE BUFFER
let g:airline#extensions#tabline#formatter = 'unique_tail'	       "SHOWS ONLY THE NAME OF THE FILE BEING MODIFIED
let g:airline_theme='transparent'	"AIRLINE THEME
