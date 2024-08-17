"Plugins
call plug#begin('~/.vim/plugged')
"Themes
Plug 'morhetz/gruvbox'	
Plug 'drsooch/gruber-darker-vim'
"FileFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"Show line numbers
set number
set relativenumber
set autoread

"Status bar
set laststatus=2
set statusline+=%F	"Show full path

"Long lines wrapped to next line
set wrap
set linebreak
set hlsearch "Highlights the search word permanently
"Clear highlighted search
nnoremap <CR> :noh<CR>
set clipboard=unnamed

set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab " spaces indent instead of tab
set autoindent
set smartindent
set scrolloff=3

"Gruvbox Theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'medium'	"hard	medium	soft
let g:gruvbox_improved_strings=10

"GruberDarker Theme
"autocmd vimenter * ++nested colorscheme GruberDarker
"let g:gruber_terminal_italic=0
"let g:gruber_terminal_bold=1

"fzf
let g:fzf_vim = {}
let g:fzf_preview_window = []

"Auto Bracket
inoremap ( ()<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>O

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/.vim/template.cpp
autocmd filetype cpp nnoremap <F9> :w <bar> !buildcpp.sh %:r <CR>
autocmd filetype python nnoremap <F9> :w <bar> !buildpy.sh %:r <CR>
autocmd filetype prolog nnoremap <F9> :w <bar> !buildpl.sh %:r <CR>
autocmd filetype perl set filetype=prolog

"Prevent []], ()), {}}
function! CheckCharacter(char)


	let line_num = line('.')
	let current_line = getline(line_num)
	let col_num = col('.')

	if current_line[col_num] != a:char
		execute "normal! a" . a:char
	else
		normal! l
	endif

endfunction


function! CheckQuotation(char)

    echom "Tab width set to "
	let line_num = line('.')
	let current_line = getline(line_num)
	let col_num = col('.')

	if(col_num == 1)
		execute "normal! i" . a:char . a:char
		normal! h
	elseif current_line[col_num] != a:char
		execute "normal! a" . a:char . a:char
		normal! h
	else
		normal! l
	endif

endfunction

inoremap ' <C-c>:call CheckQuotation("\'")<CR>a
inoremap " <C-c>:call CheckQuotation("\"")<CR>a
inoremap ) <C-c>:call CheckCharacter(')')<CR>a
inoremap ] <C-c>:call CheckCharacter(']')<CR>a
inoremap } <C-c>:call CheckCharacter('}')<CR>a
nnoremap <C-p> :Files<CR>

