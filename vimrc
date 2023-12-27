set nocompatible
filetype off

"" runtime path

" Plugins
	call plug#begin('~/.vim/modules/')
		" fuzzy finder
			Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
			Plug 'junegunn/fzf.vim'
		" Linter
			Plug 'vim-syntastic/syntastic'
		" comment
			Plug 'tpope/vim-commentary'
	call plug#end()

filetype plugin indent on

" startup
	au BufNewFile,BufRead *.h set filetype=c
	au BufNewFile,BufRead *.py
		\set tabstop=4
		\set softtabstop=4
		\set shiftwidth=4
		\set textwidth=80
		\set expandtab
	au FileType c
		\set tabstop=4
		\set softtabstop=4
		\set shiftwidth=4
		\set textwidth=80

" extra whitespace
	au BufRead,BufNewFile *
		\ match BadWhitespace /\s\+$/
	highlight BadWhitespace ctermbg=NONE ctermfg=red cterm=underline

"let python_highlight_all=1
syntax on

" options
	set signcolumn=auto
	set encoding=utf-8
	set number
	set relativenumber
	set fileformat=unix
	set history=1000
	set undolevels=1000
	set wildignore=*.swp,*.bak,*.pyc
	set novisualbell
	set noerrorbells
	set spelllang=en_us
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set splitbelow
	set splitright
	set fillchars+=vert:\¦
	set wildmenu          " popup menu
	set wildmode=full     " popup style
	set foldmethod=indent " code folding
	set foldlevel=99
	" set foldenable
	set showcmd           " show enterd key
	set showmode          " diable showing mode in the old way
	set autochdir         " change current dir to file's dir
	set showmatch         " show match brackets, parantesies, etc..
	set autoindent        " enable line indentaion
	set smartindent       " smart indent enable
	set cindent           " more
	set bs=2              " makes the backspace work functinal
	set scrolloff=1       " start srolling from 5 lines to the end
	set updatetime=20000  " write to swapfile every 30 sec when I'm idle
	set hidden
	set list
	set listchars=tab:›\ 
	set laststatus=2
	set incsearch

" abbreviation
	ab fsf Free Software Foundation
	ab foss Free and Open Source Software
	ab hte the
	ab teh the

" colorscheme
	hi! SignColumn ctermfg=NONE     ctermbg=NONE
	hi! String     ctermfg=yellow   ctermbg=NONE
	hi! Folded     ctermfg=blue     ctermbg=NONE
	hi! SpecialKey ctermfg=darkgray ctermbg=NONE
	hi! VertSplit  ctermfg=white    ctermbg=NONE
	hi! MatchParen ctermfg=white    ctermbg=black    cterm=underline
	hi! Search     ctermbg=NONE
	hi! Visual     ctermfg=black

	hi! PmenuSel    ctermfg=magenta  ctermbg=black    cterm=NONE
	hi! Pmenu       ctermfg=black    ctermbg=magenta  cterm=NONE
	" hi! link Pmenu String
	" hi! link PmenuSel Search

	hi! ErrorMsg              ctermfg=black      ctermbg=darkred    cterm=NONE
	hi! SyntasticError        ctermfg=black      ctermbg=darkred    cterm=NONE
	hi! SyntasticErrorSign    ctermfg=darkred    ctermbg=NONE       cterm=bold
	hi! SyntasticWarning      ctermfg=black      ctermbg=darkyellow cterm=NONE
	hi! SyntasticWarningSign  ctermfg=darkyellow ctermbg=NONE       cterm=NONE
	hi! SyntasticStyleError   ctermfg=red        ctermbg=NONE       cterm=NONE
	hi! SyntasticStyleWarning ctermfg=blue       ctermbg=NONE       cterm=NONE

	" hi SpellBad ctermfg=NONE ctermbg=red 
	" hi SpellCap ctermfg=NONE ctermbg=blue 
	" highlight! SyntasticErrorSymbol ctermbg=NONE ctermfg=red 
	" highlight! SyntasticErrorLine ctermfg=red ctermbg=NONE 
	" hi! SyntasticWarning ctermfg=yellow   ctermbg=NONE 
	" hi! SyntasticInfo    ctermfg=yellow   ctermbg=NONE 
	" hi! SyntasticHint    ctermfg=yellow ctermbg=NONE 
	" hi! SyntasticWarningLine       ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticErrorLine         ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticErrorSignUnderline      ctermfg=darkred ctermbg=black 
	" hi! SyntasticWarningSignUnderline    ctermfg=darkyellow ctermbg=black 
	" hi! SyntasticErrorUnderline    ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticWarningUnderline  ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticErrorSignTex      ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticWarningSignTex    ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticErrorSignOffset   ctermfg=NONE ctermbg=NONE 
	" hi! SyntasticWarningSignOffset ctermfg=NONE ctermbg=NONE 
	" set signcolumn=number
	" highlight link SyntasticError SpellBad

" statusbar
	set laststatus=2 " show status line
	set statusline+=%f " filename
	set statusline+=\  " blank space
	set statusline+=%m " modified symbl
	set statusline+=\  " blank space
	set statusline+=%r " read-only symbl
	set statusline+=%= " separator
	set statusline+=%{&ff} " EOL char
	set statusline+=\  " blank space
	set statusline+=%y " filetype

" linter
	set statusline+=%#warningmsg#
	" set statusline+=\  " blank space
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%#errormsg#
	set statusline+=%*
	let g:syntastic_error_symbol = '??'
	let g:syntastic_warning_symbol = '!!'
	let g:syntastic_style_error_symbol = '?>'
	let g:syntastic_style_warning_symbol = '!>'
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_enable_balloons = 1
	" au FileType sh let b:syntastic_checkers = ["checkbashisms"]

" auto complation
	set complete+=i
	set complete+=d
	set complete+=kspell
	set completeopt=menuone,popup,noinsert  " always show popup menu
	" set completeopt+=menuone
	" set completeopt+=noinsert
	let g:mucomplete#completion_delay = 1
	autocmd FileType c,cpp,java 
			\set formatoptions+=ro
	autocmd FileType c,cpp 
			\set omnifunc=ccomplete#Complete

" keybind
	let mapleader=' '  " change the <localleader> Key
	let maplocalleader=',' " change the <leader> Key
	" xnoremap <leader>p "_dP<CR>
	" nnoremap <leader>P "+p<CR>
	" vnoremap <leader>y "+y<CR>
	" nnoremap <leader>y "+Y<CR>
	" nnoremap <leader>d "_d<CR>
	" vnoremap <leader>d "_d<CR>
	" to system clipboard
		xnoremap <silent> <leader>y "+y
		nnoremap <silent> <leader>y "+y
		nnoremap <silent> <leader>P "+p
		xnoremap <silent> <leader>p "_dP
		nnoremap <silent> <leader>d "_d
		vnoremap <silent> <leader>d "_d
	" buffers
		nnoremap <silent> <leader>bn :bnext<CR>
		nnoremap <silent> <leader>bp :bprevious<CR>
	" location-list
		nnoremap <silent> <leader>ln :lnext<CR>zz
		nnoremap <silent> <leader>lp :lprev<CR>zz
	" quickfix-list
		nnoremap <silent> <leader>cn :cnext<CR>zz
		nnoremap <silent> <leader>cp :cprev<CR>zz
	" fuzzy finder
		noremap <silent> <leader>pf :Files<CR>
		noremap <silent> <leader>gf :GFiles<CR>
	" x permission
		nmap <leader>x  :!chmod +x %:p<CR>
	" spell check
		nmap <leader>ss  :setlocal spell!<CR>

	" autopair
		inoremap "  ""<Left>
		inoremap `  ``<Left>
		inoremap '  ''<Left>
		inoremap (  ()<Left>
		inoremap [  []<Left>
		inoremap {  {}<Left>
		au FileType html,xml inoremap <  <><Left>

		augroup autopair_undo
			au FileType vim,text iu `
			au FileType vim,text iu '
			au FileType vim      iu "
		augroup END

" execute
	" global
		" makefile
			au FileType * nnoremap <localleader>cc :!clear;make<CR>
			au FileType * nnoremap <localleader>ca :!clear;make all<CR>
			au FileType * nnoremap <localleader>cf :!clear;make force<CR>
			au FileType * nnoremap <localleader>cb :!clear;make build<CR>
		" git
			au FileType * nnoremap <localleader>gs :!clear;git status -s<CR>
			au FileType * nnoremap <localleader>gl :!clear;git log --oneline --stat --graph --all<CR>
			au FileType * nnoremap <localleader>ga :!clear;git add %<CR>
	" c
		autocmd FileType c nnoremap <localleader>fe :!clear;./%:r<CR>
		autocmd FileType c nnoremap <localleader>fw :!clear;gcc -Wall %:r.c -o %:r<CR>
		autocmd FileType c nnoremap <localleader>fq :!clear;gcc -Wall %:r.c && ./%:r<CR>
		" autocmd FileType c nnoremap <localleader>fq :cgetexpr system('gcc -Wall % -o %:r')<CR>
	" cpp
		autocmd FileType cpp nnoremap <localleader>fe :!clear;./%:r<CR>
		autocmd FileType cpp nnoremap <localleader>fw :!clear;g++ -Wall % -o %:r<CR>
		autocmd FileType cpp nnoremap <localleader>fq :!clear;g++ -Wall % -o %:r && ./%:r<CR>
	" lua
		autocmd FileType lua nnoremap <localleader>fe :!clear;./%<CR>
		autocmd FileType lua nnoremap <localleader>fw :!clear;lua5.4 %<CR>
		" autocmd FileType lua nnoremap <localleader>fq :!clear;luac %<CR>
	" python
		autocmd FileType python nnoremap <localleader>fe :!clear;./%<CR>
		autocmd FileType python nnoremap <localleader>fw :!clear;python %<CR>
		" autocmd FileType python nnoremap <localleader>fq :!clear;python %<CR>
	" go
		autocmd FileType go nnoremap <localleader>fe :!clear;./%:r<CR>
		autocmd FileType go nnoremap <localleader>fw :!clear;go build %<CR>
		autocmd FileType go nnoremap <localleader>fq :!clear;go build % && ./%:r<CR>
	" shell
		autocmd FileType sh nnoremap <localleader>fe :!clear;./%<CR>
		autocmd FileType sh nnoremap <localleader>fw :!clear;bash %<CR>
		autocmd FileType sh nnoremap <localleader>fq :!clear;dash %<CR>
	" latex
	" groff
	" markdown
	" rmd

" netrw
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4
	let g:netrw_winsize = 80
	let g:netrw_menu = 1
	let g:netrw_altv = 1
	let g:netrw_cursor = 0
	let g:netrw_fastbrowse = 2
	let g:netrw_sort_by = "name"
	let g:netrw_sort_direction = "normal"
	nnoremap <leader>fm :Ex<CR>
	nnoremap <leader>fa :25Lex<CR>

"" Omnifunc
	" au FileType php setl ofu=phpcomplete#CompletePHP
	" au FileType ruby,eruby setl ofu=rubycomplete#Complete
	" au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
	" au FileType c setl ofu=ccomplete#CompleteCpp
	" au FileType css setl ofu=csscomplete#CompleteCSS

