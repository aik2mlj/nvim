" packadd quickscope

" execute 'luafile ' . stdpath('config') . '/lua/settings.lua'

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
endfunction

function! s:openVSCodeCommandsInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

function! s:openWhichKeyInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

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

" no highlight
noremap <LEADER>h :nohls<CR>

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

" ================
" Window Management
" ================

noremap s <nop>
noremap ss :call VSCodeNotify("workbench.action.splitEditor")<CR>
noremap sd :call VSCodeNotify("workbench.action.splitEditorDown")<CR>
noremap sk :call VSCodeNotify("workbench.action.splitEditorUp")<CR>
noremap sj :call VSCodeNotify("workbench.action.splitEditorDown")<CR>
noremap sh :call VSCodeNotify("workbench.action.splitEditorLeft")<CR>
noremap sl :call VSCodeNotify("workbench.action.splitEditorRight")<CR>
nnoremap <silent> <C-f> :call VSCodeNotify('workbench.action.navigateEditorGroups')<CR>
xnoremap <silent> <C-f> :call VSCodeNotify('workbench.action.navigateEditorGroups')<CR>
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap gd

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap <expr> <C-/> <SID>vscodeCommentary()
nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Simulate same TAB behavior in VSCode

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

autocmd InsertLeave * :call SwitchInputMethodToDefault()
autocmd InsertEnter * :call SwitchInputMethodBack()