" it enable all 257 colors in any termianl
set t_Co=256

" does not create the .swp file
set noswapfile

" it does not allow the old vi setting to medddle in with the current vim 
set nocompatible

" this provides the number at the side
set number

" gives the relative number with the number of the line you are currently In 
set rnu

"add the next line indentation based on the previous line 
set autoindent

"add the smart indent in some of the programming language
set smartindent
"but dont forget to disable this both when using plugins like prettier as they will hinder the formatting 

"set cursorline highlighiting horizonatlly
set cursorline

"customize your the horizonatal cursor line
highlight CursorLine cterm=NONE ctermbg=darkgray
highlight CursorLineNr cterm=NONE ctermbg=none

"syntax highlighting on 
"syntax on

"disables the highlight of the serch word in your entire file
set nohlsearch

"enables the viewing of the matchign parethesis or brackets when placed your cursor 
set showmatch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set smartcase

" Set the commands to save in history default number is 20.
set history=1000

"add the wildmenu
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Use Gruvbox dark mode
let g:gruvbox_contrast_dark = 'hard'
"color theme for vim 
colorscheme gruvbox
set bg=dark




" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

"given by sajen to copy the text in clipboard
vnoremap cc :w !xclip -selection clipboard<CR><CR>
inoremap jj <Esc>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" All the universal customization goes here 
" This will enable code folding ........ Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"doesnt add comments when i press enter or add new line using 'o' after i write comments
augroup NoAutoComment
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END


" }}}


" STATUS LINE ------------------------------------------------------------ {{{


" }}}

