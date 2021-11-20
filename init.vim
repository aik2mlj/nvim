set nu
set relativenumber
set hls
set incsearch
set smartcase
set scrolloff=3
set visualbell
set showcmd
set splitright
set splitbelow
set wildmenu
set shortmess+=c
" indent settings
set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set autoindent
set indentexpr=
" wrapping
set wrap
set tw=0
" no time out
set notimeout
set ttimeoutlen=0
" show whitespace
set list
set listchars=tab:\|\ ,trail:▫
" can move to void in virtual mode
set virtualedit=block

" set <LEADER> as <SPACE>
let mapleader=" "

" open vimrc at any time
noremap <LEADER>rc :e $MYVIMRC<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Indentation
nnoremap < <<
nnoremap > >>

" change line color
hi LineNr ctermfg=grey guifg=grey

" save and quit
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>s :w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <ESC>:q!<CR>
inoremap <C-s> <ESC>:w<CR>

" redo
nnoremap U <C-r>

" moving around
noremap <silent> H ^
noremap <silent> L $
noremap <silent> J 5j
noremap <silent> K 5k
noremap <C-j> J
noremap <C-k> K

" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>o <C-w>o

" disable s
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap ss :vsplit<CR>
noremap sd :split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap su <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Create a new tab with tu
noremap tt :tabe<CR>
noremap tT :tab split<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

