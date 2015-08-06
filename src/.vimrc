" first run in ~ : git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on


autocmd vimenter * NERDTree

let NERDTreeShowHidden=1
au BufRead,BufNewFile *.hamlc set ft=haml

" color scheme
syntax enable
colorschem solarized
set background=dark

" lines numbered
set number

" spacing/tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" search options
set hlsearch
set ignorecase
set smartcase

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=magenta
match ExtraWhitespace /\s\+$/


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

