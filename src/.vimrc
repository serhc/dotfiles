" for setup, run in $HOME:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"general productivity
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gmarik/vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vimwiki/vimwiki'

"prettiness
Plugin 'flazz/vim-colorschemes'

"syntax highlighting
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""
" plugin configurations

"""""""""""""""""""""""""
let NERDTreeShowHidden=1
au BufRead,BufNewFile *.hamlc set ft=haml

" color scheme
syntax enable
set t_Co=256
set background=dark
hi Normal ctermbg=none
hi NonText ctermbg=none
let g:solarized_termtrans=1
colorscheme solarized

" vim airline
" allow airline to open on startup
set laststatus=2

" set vim airline theme
let g:airline_theme='solarized'


"""""""""""""""""""""""""
" vim core configurations

"""""""""""""""""""""""""

" lines numbered
set number
"set relativenumber

" spacing/tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=magenta
match ExtraWhitespace /\s\+$/

" clipboard
set clipboard=unnamed

" linewrapping
set nowrap

" redraw performance
set lazyredraw

" singular swapfile directory
set directory=$HOME/.vim/swps

" disable beeping in WSL
set visualbell
set t_vb=

" toggle a comment for a line
" see http://www.perlmonks.org/?node_id=561215 for more info
function ToggleComment()
	let comment_start = '#'
	let comment_end   = ''

	if &filetype == 'cpp'
		let comment_start = '\/\/'
"		let comment_start = '\/\* '
"		let comment_end   = ' \*\/'
	endif
	if &filetype == 'css'
		let comment_start = '\/\* '
		let comment_end   = ' \*\/'
	endif
	if &filetype == 'haskell'
		let comment_start = '--'
	endif
  if &filetype == 'scala'
    let comment_start = '\/\/'
  endif
	if &filetype == 'javascript'
		let comment_start = '\/\/'
	endif
	if &filetype == 'sql'
"		let comment_start = '--'
		let comment_start = '\/\* '
		let comment_end   = ' \*\/'
	endif
  if &filetype == 'scss'
    let comment_start ='\/\/'
  endif
  if &filetype == 'go'
    let comment_start ='\/\/'
  endif
  if &filetype == 'cljs'
    let comment_start = ';;'
  endif
	" if the comment start is at the beginning of the line and isn't followed
	" by a space (i.e. the most likely form of an actual comment, to keep from
	" uncommenting real comments
	if getline('.') =~ ('^' . comment_start . '\( \w\)\@!')
		execute 's/^' . comment_start . '//'
		execute 's/' . comment_end . '$//'
	else
		execute 's/^/' . comment_start . '/'
		execute 's/$/' . comment_end . '/'
	endif
endfunction
map <silent> X :call ToggleComment()<cr>

function CleanSQL()
  silent! %s/\\n/\r/g
  silent! %s/\(as \w*,\)/\1\r/g
  silent! %s/\s*\n/\r/g
  execute "normal! gg=G"
  silent! set ft=sql
endfunction

function CTWS()
  silent! %s/\s*\n/\r/g
  execute "normal! dd"
endfunction

:command L set background=light
:command D set background=dark
:command NT :NERDTree
:command S colorscheme solarized |
           \ let g:solarized_termtrans=1 |
           \ set background=dark
:command E :Explore
