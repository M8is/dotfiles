" .vimrc by M8is

" VUNDLE CONFIG / ADD PLUGINS HERE {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Code search
Plugin 'rking/ag.vim'

" Python Auto-Completion
Plugin 'davidhalter/jedi-vim'

" setup some sensible defaults
Plugin 'tpope/vim-sensible'

" plugin for Python Code Folding
Plugin 'tmhedberg/SimpylFold'

" Syntax Checking and Highlighting
Plugin 'scrooloose/syntastic'

" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Fuzzy file search
Plugin 'kien/ctrlp.vim'

" Git commands
Plugin 'tpope/vim-fugitive'

" Bottom Status Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Configure Color Schemes
Plugin 'jnurmine/Zenburn'

" Visualize undo tree
Plugin 'sjl/gundo.vim'

" Better line numbers
Bundle 'myusuf3/numbers.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}
" GENERAL CONFIG {{{

" enable backup and backup in tmp directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" open split window below or to the right
set splitbelow
set splitright

set cursorline	" highlight current line
set lazyredraw	" redraw only when needed, e.g. not during macros
set showmatch	" hight matching [{()}] 

set encoding=utf-8

colors zenburn 
set background=light

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" source: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
	let isfirst = 1
	let words = []
	for word in split(a:cmdline)
		if isfirst
			let isfirst = 0  " don't change first word (shell command)
		else
			if word[0] =~ '\v[%#<]'
				let word = expand(word)
			endif
			let word = shellescape(word, 1)
		endif
		call add(words, word)
	endfor
	let expanded_cmdline = join(words)
	tabnew
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"	call setline(1, 'You entered:  ' . a:cmdline)
"	call setline(2, 'Expanded to:  ' . expanded_cmdline)
	call append(line('$'), substitute(getline(2), '.', '=', 'g'))
	silent execute '$read !'. expanded_cmdline 1
endfunction

command! RunTests call RunTests()
function! RunTests()
	silent execute '!touch nosetests.log'
	redir! >/nosetests.log
	silent! ./mubench.pipeline/run_tests
	redir END
endfunction

" }}}
" AUTOCOMMANDS {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" }}}
" KEY MAPPINGS {{{

let mapleader=","

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

nnoremap <silent> <leader>t :Shell ./mubench.pipeline/python_tests<CR> 

nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>

" set key to toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set folding
nnoremap <leader><space> za

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>

" }}}
" PLUGIN CONFIG {{{ 

" configure line numbers
set number
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" CtrlP config
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" note that this disables show_hidden and custom_ignore options of ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let NERDTreeIgnore=['\.pyc$', '\~$']

let g:SimpylFold_docstring_preview=1

let g:syntastic_python_python_exec='python3'

let g:airline_theme='light'

" enable fonts
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif

" always show status bar
set laststatus=2
" Use 256 colours
set t_Co=256

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" }}}
" PYTHON {{{

" Virtualenv support for Python
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRUTAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" PEP8 indentation for Python
au BufNewFile,BufRead *.py
	\ setlocal tabstop=4
	\|setlocal softtabstop=4
	\|setlocal shiftwidth=4
	\|setlocal expandtab
	\|setlocal autoindent 
	\|setlocal fileformat=unix

" enable code folding
set foldmethod=indent
set foldlevel=99

let python_highlight_all=1
syntax on

" }}}
" INITIALIZATION INSTRUCTIONS {{{

" Setup Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
" run :PluginInstall in vim 

" install silverseacher-ag
" sudo apt install silversearcher-ag

" }}}

" open this file with folded sections
set modelines=1
" vim:foldmethod=marker:foldlevel=0
