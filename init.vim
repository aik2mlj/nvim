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
set mouse=a
set clipboard+=unnamedplus

" set <LEADER> as <SPACE>
let mapleader=" "

" open vimrc at any time
noremap <LEADER>rc :e $MYVIMRC<CR>

" change line color
hi LineNr ctermfg=grey guifg=grey

" save and quit
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>Q :q!<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <ESC>:q!<CR>
inoremap <C-s> <ESC>:w<CR>

" no highlight
noremap <LEADER>h :nohls<CR>

" change join
noremap <LEADER>j J

" ===========================
" VSCode Compatiable Settings
" ===========================

map Q gq

" make Y to copy till the end of the line
nnoremap Y y$

" Indentation
nnoremap < <<
nnoremap > >>

" redo
nnoremap U <C-r>

" moving around
noremap <silent> H ^
noremap <silent> L $
noremap <silent> J 5j
noremap <silent> K 5k

" exchange lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <ESC>:m .+1<CR>==gi
inoremap <M-k> <ESC>:m .-2<CR>==gi
xnoremap <M-j> :m'>+<CR>==gv
xnoremap <M-k> :m-2<CR>==gv

" duplicate lines
nnoremap <M-J> :t .<CR>
nnoremap <M-K> :t .-1<CR>
xnoremap <M-J> :t'><CR>gv
xnoremap <M-K> :t-1<CR>gv

" ================
" Window Management
" ================

" Use ; + new arrow keys for moving the cursor around windows
noremap <C-f> <C-w>w
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s <nop>
noremap ss :vsplit<CR>
noremap sd :split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
noremap so <C-w>o
" Place the two screens up and down
noremap su <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Resize splits with arrow keys
noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize-5<CR>
noremap <C-right> :vertical resize+5<CR>

" ================
" Buffer Management
" ================

nnoremap <M-h> :bp<CR>
nnoremap <M-l> :bn<CR>
nnoremap <M-p> :b#<CR>
nnoremap <M-n> :enew<CR>
nnoremap <M-q> :bd<CR>
nnoremap <M-Q> :bd!<CR>
inoremap <M-h> <ESC>:bp<CR>
inoremap <M-l> <ESC>:bn<CR>
inoremap <M-p> <ESC>:b#<CR>
inoremap <M-n> <ESC>:enew<CR>
inoremap <M-q> <ESC>:bd<CR>
inoremap <M-Q> <ESC>:bd!<CR>
noremap <C-n> :vnew<CR>

" ================
" Tab Management
" ================

" Create a new tab with tu
noremap tt :tabe<CR>
noremap tT :tab split<CR>
" Move around tabs with tn and ti
noremap tk :tabp<CR>
noremap tj :tabn<CR>
" Move the tabs with tmn and tmi
noremap th :tabm -1<CR>
noremap tl :tabm +1<CR>
" Switch to last-active tab (copy from stackoverflow)
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
noremap <LEADER>t :exe "tabn " . g:Lasttab<cr>

" ================
" Miscellaneous
" ================

" Input method auto switching

let g:ImSelectPath = 'C:\\im-select\\im-select.exe'
let g:DefaultCode = 1033
let g:InputMethodCode = g:DefaultCode

function! SwitchInputMethodToDefault()
    let g:InputMethodCode = system(g:ImSelectPath)
    if g:InputMethodCode != g:DefaultCode
        silent exe '!'.g:ImSelectPath g:DefaultCode
    endif
endfunction

function! SwitchInputMethodBack()
    if g:InputMethodCode != g:DefaultCode
        silent exe '!'.g:ImSelectPath g:InputMethodCode
    endif
endfunction

" autocmd InsertLeave * :call SwitchInputMethodToDefault()
" autocmd InsertEnter * :call SwitchInputMethodBack()
