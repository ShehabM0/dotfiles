"Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'	"Theme
call plug#end()

"Show line numbers
set number
set relativenumber

"Status bar
set laststatus=2
set statusline+=%F	"Show full path

"Long lines wrapped to next line
set wrap
set hlsearch

set shiftwidth=4
set tabstop=4
set scrolloff=3

"Gruvbox Theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'soft'	"hard	medium	soft

"Auto Bracket
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O




"Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/.vim/template.cpp




" Prevent []], ()), {}}
function! CheckCharacter(char)

	let line_num = line('.')
	let current_line = getline(line_num)
	let col_num = col('.')

	"if current_line[col_num] == a:char && current_line[col_num] == current_line[col_num+1]

	if current_line[col_num] != a:char
		execute "normal! a" . a:char
	endif

endfunction


function! CheckQuotation(char)

	let line_num = line('.')
	let current_line = getline(line_num)
	let col_num = col('.')

	if current_line[col_num] != a:char
		execute "normal! a" . a:char . a:char
		normal! h
	else
		normal! l
	endif

endfunction

inoremap ' <C-c>:call CheckQuotation("\'")<CR>a
inoremap " <C-c>:call CheckQuotation("\"")<CR>a
inoremap ) <C-c>:call CheckCharacter(')')<CR>a<right>
inoremap ] <C-c>:call CheckCharacter(']')<CR>a<right>
inoremap } <C-c>:call CheckCharacter('}')<CR>a<right>


