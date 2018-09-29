" This is necessary for certain vim features
set nocompatible

" Store all swap files in the one location
silent !mkdir -p /var/tmp/vim
set directory=/var/tmp/vim//

" Show file name in terminal window title bar
set title

" Turn on hybrid line numbering
set relativenumber
set number

" Highlight the current line and line number
" TODO: Work out why the next line won't set the line number colour
hi CursorLineNR ctermbg=3 ctermfg=8
set cursorline

" Set the cursor shape
" Steady block in normal mode
let &t_EI = "\<Esc>[2 q"  " Ending insert mode.
" Blinking bar in insert mode
let &t_SI = "\<Esc>[5 q"  " Starting insert mode.
" Blinking underline in replace mode
let &t_SR = "\<Esc>[3 q"  " Starting replace mode.

"Keep some space between the cursor and the edges of the window.
set scroll=1
set scrolloff=2
set sidescroll=1
set sidescrolloff=5

" Remap the escape key
inoremap jk <Esc>

" Increase the register size from the default of 50 lines
set viminfo='20,<1000

" Make searches case insensitive if they don't contain any uppercase letters
set ignorecase
set smartcase

" Make searches find the first hit while typing
set incsearch

" Highlight search results
set hlsearch

" Unhighlight search results
nnoremap <silent> // :noh<CR>

" Expand all tabs to spaces
set expandtab

" Global tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Two-space tabs for certain file types
autocmd BufNewFile,BufRead *.{css,html,js,less,yml} set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Set non-default filetypes
au BufNewFile,BufRead *.less setf less
au BufNewFile,BufRead *.pug setf pug

" Match indentation of new line to previous line
set autoindent

" When joining lines, don't add two spaces after punctuation.
set nojoinspaces

" Set working space to 79 characters wide
set textwidth=79

" Show a guide after column 79
set colorcolumn=+1
hi ColorColumn ctermbg=0

" Turn off wrapping
set nowrap

" Don't add linebreaks to wrap text files
autocmd FileType text setlocal
    \ formatoptions-=t
    \ wrap
    " \ linebreak
    " \ nolist

" Display tabs, trailing whitespace, spillover at start and end of lines.
set list listchars=tab:»·,trail:·,precedes:<,extends:>
" TODO: Get the next two lines working. At the moment they don't appear to be
" working.
" hi SpecialKey term=bold cterm=bold ctermfg=11 ctermbg=8
" hi NonText term=bold cterm=bold ctermfg=9 ctermbg=8

" Enable indent and manual folding
" http://vim.wikia.com/wiki/Folding
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
set foldlevel=99

" Map folding to the spacebar in normal and insert modes
nnoremap <space> za
vnoremap <space> zf

" Show the cursor position all the time
set ruler

" Enable line-at-a-time movement of single lines and selected blocks
" TODO: Currently this requires Ctl + Shift + j for down movements and
"       Ctl + Shift + k for up. Make the commands work without the Shift key.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Be able to switch away from a modified buffer without writing to it.
set hidden

" Navigate buffers using Tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Open a new buffer
nmap <leader>n :enew<cr>

" Close the current buffer without saving it
nmap <leader>bq :bd<CR>
nmap <leader>bq! :bd!<CR>

" Save the current buffer then close it
nmap <leader>bw :w<CR>
nmap <leader>bw! :w!<CR>
nmap <leader>bwq :w <BAR> bd<CR>
nmap <leader>bwq! :w! <BAR> bd<CR>

" Open split window in natural location
set splitbelow
set splitright

" Load plugins
" After adding a plugin run ``:PlugInstall`` from within Vim.
" TODO: Figure out how to let user extend this with a .vimrc.personal file
" TODO: Get fzf working too.
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Import personal settings.
" TODO: Check that this works.
runtime vimrc_plugins.personal
call plug#end()

" Set colorscheme
colorscheme base16-tomorrow-night

" TODO: Work out what this does
filetype plugin indent on

" Stop the cursor being invisible when over a search match
hi Search cterm=NONE ctermbg=3 ctermfg=0

" Configure vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline_theme='base16_tomorrow'
set laststatus=2

" Strip trailing whitespace when files are saved.
autocmd BufWritePost * :%s/\s\+$//e

" Easily toggle `paste` mode
set pastetoggle=<leader>p

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Only use Flake8, rather than the default python checker followed by Flake8.
let g:syntastic_python_checkers = ['flake8']

" Set ranger as the file chooser.
" https://github.com/ranger/ranger/blob/v1.7.1/examples/vim_file_chooser.vim
function! RangeChooser()
    let temp = tempname()
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>f :<C-U>RangerChooser<CR>

" Import personal settings.
" TODO: Check that this works.
runtime vimrc.personal
