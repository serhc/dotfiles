execute pathogen#infect()

autocmd vimenter * NERDTree

au BufRead,BufNewFile *.hamlc set ft=haml

syntax enable
colorschem solarized
let g:solarized_termcolors=256
if has('gui_running')
    set background=dark
else
    set background=dark
endif

set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set ignorecase
set smartcase

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
	if &filetype == 'vim'
		let comment_start = '"'
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
map <silent> X :call ToggleComment()<cr>j
