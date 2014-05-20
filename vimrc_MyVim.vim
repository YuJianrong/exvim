" General vim rc, for the general settings include common plugins

" General start
filetype on                 " enable file type detection 
filetype plugin on
set nocompatible
"  $VIMRUNTIME/vimrc_example.vim >> code below

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"  $VIMRUNTIME/vimrc_example.vim >> code above

behave xterm


execute pathogen#infect()

"" ==== Custom setting ====
" setup back and swap directory
let data_dir = $HOME.'/exVim/data/'
let backup_dir = data_dir . 'backup'
let swap_dir = data_dir . 'swap'
if finddir(data_dir) == ''
    silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
    silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
    silent call mkdir(swap_dir)
endif
set backup                  " make backup file and leave it around 
set backupdir=$HOME/exVim/data/backup " where to put backup file
set directory=$HOME/exVim/data/swap " where to put swap file 
set nocompatible            " Use Vim settings, rather then Vi settings (much better!). This must be first, because it changes other options as a side effect.
set cindent shiftwidth=4    " Set cindent on to autoinent when editing C/C++ file, with 4 shift width
set tabstop=4               " Set tabstop to 4 characters
set expandtab               " Set expandtab on, the tab will be change to space automaticaly
set nowrap                  " no wrap on the end of the editor screen.
set nomore                  " no "-- more --" message displayed
set viminfo+=!              " make sure it can save viminfo 
set shellredir=>%s\ 2>&1    " redirection operator stderr to stdout
set history=50              " keep 50 lines of command line history
set updatetime=1000         " save the modification to swap file when no input and the time passed, default is 4000
set autoread                " auto read when changed ( better for vc/vim change )
set incsearch               " do incremental searching
set ignorecase              " Set search/replace pattern to ignore case 
set smartcase               " smartcase, If there is upper case character in the search patern, the 'ignorecase' option will be override.
set guioptions+=b           " Present the bottom scrollbar when the longest visible line exceen the window
set guioptions-=m           " hide menu 
set guioptions-=T           " hide toolbar
set clipboard=unnamed       " Make the vim to use the windows's clipboard as the default register for yank/paste
set nrformats=              " Set Number format to null(default is octal) ,007 will not increase to 010 anymore when press CTRL-A
set virtualedit=block       " In Visual Block Mode, cursor can be positioned where there is no actual character
set showmatch               " ShowMatch (bracket)
set matchtime=0             " 0 second to show the matching paren ( much faster )
set number                  " Show LineNumber
set scrolloff=0             " minimal number of screen lines to keep above and below the cursor 
set wildmenu                " turn on wild menu, tab complete for command line
set showcmd	                " display incomplete commands
set cmdheight=1             " 1 screen lines to use for the command-line 
set ruler                   " show the cursor position all the time
set hidden                  " allow to change buffer without saving 
set shortmess=atToO         " shortens messages to avoid 'press a key' prompt 
set lazyredraw              " do not redraw while executing macros (much faster) 
set display+=lastline       " for easy browse last line with wrap text
set laststatus=2            " always have status-line
set showfulltag             " show tag with function protype.
set autoindent              " autoindent 
set smartindent             " smartindent 
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30 " default '0{,0},0),:,0#,!^F,o,O,e' disable 0# for not ident preprocess
set ambiwidth=double        " set for width of CJK special charater font
set grepprg=lid\ -Rgrep\ -s " set this to use id-utils for global search
set grepformat=%f:%l:%m     " set this to use id-utils for global search
set foldmethod=marker foldmarker={,} foldlevel=9999
set diffopt=filler,context:9999 " do not hide the same lines
set completeopt=menuone     " set completeopt don't show preview
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find 
set makeef=error.err        " the errorfile for :make and :grep 
set fileencodings=ucs-bom,utf-8,cp936,cp932,cp950,latin1 "default for utf8, then GB2312, sjis and BIG5
set encoding=utf-8          " utf-8 default
if has("mac") && has("gui_running")
  set iminsert=2
endif 
if has("mac")               " Better font for coding
    let &guifont="Menlo Regular:h12" 
else
    " if getfontname("Bitstream_Vera_Sans_Mono") != "" 
        " set guifont=Lucida_Sans_Typewriter:h8:cANSI
        set guifont=Bitstream_Vera_Sans_Mono:h08:cANSI
    " else
        " set guifont=Lucida_Console:h10:cANSI
    " endif
endif
let g:gui_font = &guifont
if has("gui_running")
    set lines=58 columns=220    " Better size for large screen
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
" only supoort in 7.3 or higher
if v:version >= 703
    set noacd " no autochchdir
endif

au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full) 
au BufEnter * set formatoptions-=o   " do not copy the comment mark when use 'o' to add a new line.
au BufEnter,BufNewFile *.vim set iskeyword+=#
au BufEnter,BufNewFile *vimrc* set iskeyword+=#
au BufNewFile,BufRead *.avs set syntax=avs " for avs syntax file.
au BufEnter *.py,*.pyw call CheckIfExpandTab() " if edit python scripts, check if have \t. ( python said: the programme can only use \t or not, but cannot use them together )
function CheckIfExpandTab()
    let has_noexpandtab = search('^\t','wn')
    let has_expandtab = search('^    ','wn')

    "
    if has_noexpandtab && has_expandtab
        let idx = inputlist ( ["ERROR: current file exists both expand and noexpand TAB, python can only use one of these two mode in one file.\nSelect Tab Expand Type:",
                    \ '1. expand (tab=space, recommended)', 
                    \ '2. noexpand (tab=\t, currently have risk)',
                    \ '3. do nothing (I will handle it by myself)'])
        let tab_space = printf('%*s',&tabstop,'')
        if idx == 1
            let has_noexpandtab = 0
            let has_expandtab = 1
            silent exec '%s/\t/' . tab_space . '/g'
        elseif idx == 2
            let has_noexpandtab = 1
            let has_expandtab = 0
            silent exec '%s/' . tab_space . '/\t/g'
        else
            return
        endif
    endif

    " 
    if has_noexpandtab == 1 && has_expandtab == 0  
        echomsg 'substitute space to TAB...'
        set noexpandtab
        echomsg 'done!'
    elseif has_noexpandtab == 0 && has_expandtab == 1
        echomsg 'substitute TAB to space...'
        set expandtab
        echomsg 'done!'
    else
        " it may be a new file
        " we use original vim setting
    endif
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()  " Add highlighting for function definition in C++ 
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze\ *([^)]*\()\s*\(const\)\?\)\?[^;]*$"
    hi def link cppFuncDef Special
endfunction

" Disable auto-comment for c/cpp, lua, javascript, c# and vim-script
au FileType c,cpp,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:// 
au FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f:// 
au FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
au FileType lua set comments=f:--
au FileType javascript,html,typescript set tabstop=2 shiftwidth=2


""--------------------------------------------------------------------------------
"" ==== normal key mappings ====
" Move in fold
map z<Up> zk
map z<Down> zj
map <A-Up> zk
map <A-Down> zj
" Easy Diff goto
map <C-Up> [c
map <C-Down> ]c
" Easy buffer go
" map <C-Left> :bp!<CR>
" map <C-Right> :bn!<CR>
" Enhance '<' '>' , do not need to reselect the block after shift it.
vnoremap < <gv
vnoremap > >gv
" Disable Middle mouse button to paste
map  <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>
map  <2-MiddleMouse> <Nop>
map!  <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map! <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
map! <4-MiddleMouse> <Nop>
" map Up & Down to gj & gk, helpful for wrap text edit
map <Up> gk
map <Down> gj
" make visual paste to copy the content pasted(like in windows)
vnoremap p pgvy


""--------------------------------------------------------------------------------
"" ==== New functions ====

" use GNU Diff
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary -w '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  silent execute '!' . '"diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
endfunction

" Set new Rgrep as the grep to search patterns on the C/C++ files as default
command -nargs=+ Rgrep :grep -r --include="*.cpp" --include="*.c" --include="*.hpp" --include="*.h" <q-args> *
map <Leader>fc :call <SID>Grep_Cfiles()<CR>
function s:Grep_Cfiles()
    let l_str=input("Input the keyword to be searched: ")
    exec ":grep -r --include=\"*.cpp\" --include=\"*.c\" --include=\"*.hpp\" --include=\"*.h\" " . l_str . " *"
endfunction


""--------------------------------------------------------------------------------
"" ====  F-Key mappings ====

" S-F1:  Switch to Chinese Mode (Both Enconding and uiFont)
function LoopEncoding()
    if &encoding == 'utf-8' && &guifont !~ 'simsun'
        set encoding=cp950
        set fileencodings=
        set fileencoding=cp950
        exe "e!"
        if getfontname("MingLiU") != ""
            set guifont=MingLiU:h10:cCHINESEBIG5
        else
            let &guifont=g:gui_font
        endif
    elseif &encoding == 'cp950'
        set encoding=cp932
        set fileencodings=
        set fileencoding=cp932
        exe "e!"
        if getfontname("MS_Gothic") != ""
            set guifont=MS_Gothic:h10:cSHIFTJIS
        else
            let &guifont=g:gui_font
        endif
    elseif &encoding == 'cp932'
        set encoding=cp936
        set fileencodings=
        set fileencoding=cp936
        exe "e!"
        if getfontname("NSimSun") != ""
            set guifont=NSimSun:h10:cGB2312
        else
            let &guifont=g:gui_font
        endif
    elseif &encoding == 'cp936'
        set encoding=utf-8
        set fileencodings=
        set fileencoding=utf
        exe "e!"
        if getfontname("NSimSun") != ""
            set guifont=NSimSun:h10:cGB2312
        else
            let &guifont=g:gui_font
        endif
    else
        set encoding=utf-8
        set fileencodings=
        set fileencoding=utf-8
        exe "e!"
        let &guifont=g:gui_font
    endif
endfunction
nmap <S-F1> :call LoopEncoding()<CR>

" A-F1: Set Search pattern highlight on/off, same as Alt-1, Alt-2 , Alt-3 in
" ex-utilities
nmap <A-F1> :call setreg('/','')<CR>

" F2: reserved for tagbar

" F3: map LookupFile
nmap <unique> <silent> <A-F3> <Plug>LookupFile

" F4-F9: reserved for ex-uitlities

" F10 is reserved by windows system

" F11 is reserved for EnhCommentify
" <C-F11>: inser/remove /**/
function! RemoveCPPBlockCmt()
    if searchpair('\/\*','','\*\/','n') != 0
        norm! [/xx]/hxx
    endif
endfunction
vmap <C-F11> c/*<ESC>igp*/<ESC>
nmap <C-F11> :call RemoveCPPBlockCmt()<CR>
" A-F11: Insert/delete '#if 0' and '#endif' between the selection
function! InsertIF() range
    let lstline = a:lastline + 1 
    call append( a:lastline , "#endif")
    call append( a:firstline -1 , "#if 0")
    exec ":" . lstline
endfunction
vmap <A-F11> :call InsertIF()<CR>
nmap <A-F11> mo[#dd]#dd`o

" F12: toogle the menu and toolbar
function! ToggleMenuToolbar()
    if match(&guioptions, 'm') != -1
        set guioptions-=m
        set guioptions-=T
    else
        set guioptions+=m
        set guioptions+=T
    endif
endfunction
vmap <F12> <ESC>:call ToggleMenuToolbar()<CR>
imap <F12> <ESC>:call ToggleMenuToolbar()<CR>
nmap <F12> :call ToggleMenuToolbar()<CR>


""--------------------------------------------------------------------------------
"" ====  Quick Reference  ====
function Show_exVimEasyQuickReference()
    " if v:lang == 'zh_CN'
    "     " show Chinese QuickReference
    "     echo " * <F1> : ex-plugins 窗口在线帮助\n"
    "     echo " * <leader><F1> : 显示 exVim Easy 快捷键快速参考\n"
    "     echo " * <Alt-F1> : 清除查找寄存器 ('/' register) 以取消查找高亮\n"
    "     echo " * <F2> : 开/关 tagBar 插件窗口\n"
    "     echo " * <leader><F2> : 开/关 exMarksBrowser 插件窗口\n"
    "     echo " * <F3> : 开/关 exBufExplorer 插件窗口\n"
    "     echo " * <leader><F3> : 将当前文件加入到 exBufExplorer 的 Bookmark 中\n"
    "     echo " * <Alt-F3> : 开/关 lookupfile 插件窗口\n"
    "     echo " * <F4> : 开/关 exMacro\n"
    "     echo " * <Alt-F4> : 我没有映射过这个快捷键，不过你仍然可以按了看看是什么功能 ;-p\n"
    "     echo " * <F5> : 开/关 Project Window\n"
    "     echo " * <leader><F5> : 定位 Project Window 光标到编辑中的文件\n"
    "     echo " * <F6> : 开/关 Symbol list window\n"
    "     echo " * <F7> : 以光标所在单词打开 Tag select window 以实现tag跳转\n"
    "     echo " * <leader><F7> : 开/关 Tag select window\n"
    "     echo " * <F8> : 以光标所在单词打开 Global search window 以实现全局查找\n"
    "     echo " * <leader><F8> : 开/关 Global search window\n"
    "     echo " * <F9> : 开/关 Quick Fix window\n"
    "     echo " * <F11> : 注释/取消注释源代码（支持大部分语言）\n"
    "     echo " * <leader><F11> : 可视模式 （Visual Mode）: 加入 cpp 块注释 ('/ /'); 普通模式（normal mode）: 删除 cpp 块注释\n"
    "     echo " * <Alt-F11> : 可视模式 （Visual Mode）: 加入 #if 0/#endif ; 普通模式（normal mode）: 删除 #if 0/#endif\n"
    "     echo " * <F12> : 显示/隐藏gvim的菜单和工具栏 \n"
    "     echo " * <leader>ve : 转到.vimentry配置文件 \n"
    " else
        " show English QuickReference
        echo " * <F1> : Online help in ex-plugins window\n"
        echo " * <leader><F1> : Show the Quick Reference for exVim Easy\n"
        echo " * <Alt-F1> : Clear the search register to disable the search highlight\n"
        echo " * <F2> : Toggle plugin tagBar \n"
        echo " * <leader><F2> : Toggle exMarksBrowser Window\n"
        echo " * <F3> : Toggle exBufExplorer Window\n"
        echo " * <leader><F3> : Add the current buffer to the bookmark of exBufExplorer\n"
        echo " * <Alt-F3> : Toggle plugin lookupfile\n"
        echo " * <F4> : Toggle exMacro\n"
        echo " * <Alt-F4> : I had not mapping this key but you can try it to see the result ;-p\n"
        echo " * <F5> : Toggle Project Window\n"
        echo " * <leader><F5> : Position the cursor of Project Window to the editing file\n"
        echo " * <F6> : Toggle Symbol list window\n"
        echo " * <F7> : Open Tag select window by the word on the cursor for tag jumping\n"
        echo " * <leader><F7> : Toggle Tag select window\n"
        echo " * <F8> : Open Global search window by the word on the cursor for Global search\n"
        echo " * <leader><F8> : Toggle Global search window\n"
        echo " * <F9> : Toggle Quick Fix window\n"
        echo " * <F11> : Comment/uncomment the code\n"
        echo " * <leader><F11> : In visual mode: Add cpp block comment ('/ /'); In normal mode: delete cpp block comment\n"
        echo " * <Alt-F11> : In visual mode: Add #if 0/#endif ; In normal mode: delete #if 0/#endif\n"
        echo " * <F12> : Toggle menu and toolbar of gvim \n"
        echo " * <leader>ve : Open the .vimentry file for editing\n"
    " endif
endfunction

nmap <leader><F1> :call Show_exVimEasyQuickReference()<CR>



""--------------------------------------------------------------------------------
"" ==== Plugin settings ====


" --------------------
" TagBar
" --------------------
" F2:  Switch on/off TagBar
nnoremap <silent> <F2> :TagbarOpen<CR>
" ctags find the tags file from the current path instead of the path of
" currect file
au BufNewFile,BufEnter * set cpoptions+=d
let g:tagbar_autoclose = 1 "automatically close when you jump to a tag.
let g:tagbar_autofocus = 1 "move to the Tagbar window when it is opened.
let g:tagbar_usearrows = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_closeWindowKey = "<F2>"


" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines) 
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) put:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer. 
" let g:miniBufExplMaxSize = 1 " <max lines: default 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers. 

"for buffers that have NOT CHANGED and are NOT VISIBLE.
hi MBENormal guibg=White
" for buffers that HAVE CHANGED and are NOT VISIBLE
hi MBEChanged guibg=Red 
" buffers that have NOT CHANGED and are VISIBLE
hi MBEVisibleNormal guibg=Gray
" buffers that have CHANGED and are VISIBLE
hi MBEVisibleChanged guibg=DarkRed



" --------------------
" EnhCommentify
" --------------------
" F11:  Insert/Remove C++ Comment ("//") before all the lines of the selection
function EnhCommentifyCallback(ft)
    if a:ft == 'lingo'
        let b:ECcommentOpen = '--'
        let b:ECcommentClose = ''
    elseif a:ft == 'go'
        let b:ECcommentOpen = '//'
        let b:ECcommentClose = ''
    elseif a:ft =~ '^\(hlsl\|swig\|c\|objc\)$' " NOTE: we have to rewrite the c comment behavior. 
        let b:ECcommentOpen = '//'
        let b:ECcommentClose = ''
    elseif a:ft == 'snippet' " for snippet
        let b:ECcommentOpen = '#'
        let b:ECcommentClose = ''
    elseif a:ft == 'maxscript' " for maxscript
        let b:ECcommentOpen = '--'
        let b:ECcommentClose = ''
    elseif a:ft == 'typescript'
        let b:ECcommentOpen = '//'
        let b:ECcommentClose = ''
    endif
endfunction
let g:EnhCommentifyCallbackExists = 'Yes'
let g:EnhCommentifyFirstLineMode='yes'
let g:EnhCommentifyRespectIndent='yes'
let g:EnhCommentifyUseBlockIndent='yes'
let g:EnhCommentifyAlignRight = 'yes'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyBindInNormal = 'no'
let g:EnhCommentifyBindInVisual = 'no'
let g:EnhCommentifyBindInInsert = 'no'
vmap <F11> <Plug>VisualFirstLinegv
nmap <F11> <Plug>FirstLine
imap <F11> <ESC><Plug>FirstLine
" vmap <F11> <Plug>VisualComment
" nmap <F11> <Plug>Comment
" imap <F11> <ESC><Plug>Comment
" vmap <C-F11> <Plug>VisualDeComment
" nmap <C-F11> <Plug>DeComment
" imap <C-F11> <ESC><Plug>DeComment

" -------------------
" OmniCppComplete
" -------------------
" use global scope search
let OmniCpp_GlobalScopeSearch = 1

" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1

" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1

" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0

" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1

" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1

" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]

" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

" vims under after/ftplugin does not executed, just call it manually
" OmniCppComplete initialization
au BufNewFile,BufRead *.c call omni#cpp#complete#Init()
au BufNewFile,BufRead *.cpp call omni#cpp#complete#Init()



" -------------------
" ShowMarks
" -------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" For marks a-z
hi ShowMarksHLl term=bold cterm=none ctermbg=LightBlue gui=none guibg=LightBlue
" For marks A-Z
hi ShowMarksHLu term=bold cterm=bold ctermbg=LightRed ctermfg=DarkRed gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
hi ShowMarksHLo term=bold cterm=bold ctermbg=LightYellow ctermfg=DarkYellow gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
hi ShowMarksHLm term=bold cterm=none ctermbg=LightBlue gui=none guibg=SlateBlue

let g:showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 0 


" -------------------
" LookupFile 
" -------------------
nnoremap <unique> <A-S-i> :LUTags<CR>
nnoremap <unique> <leader>lf :LUTags<CR>
nnoremap <unique> <leader>lb :LUBufs<CR>
nnoremap <unique> <silent> <Leader>lg :LUCurWord<CR>
let g:LookupFile_TagExpr = ''
let g:LookupFile_MinPatLength = 3
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_smartcase = 1
let g:LookupFile_EscCancelsPopup = 1

" ------------------------------------------------------------------ 
" Desc: zencoding 
" ------------------------------------------------------------------ 

let g:user_zen_leader_key = '<c-z>'




""--------------------------------------------------------------------------------
"" ==== obsolete ====
" Change current directory to the file of the buffer ( from Script#65"CD.vim"
" au   BufEnter *   execute ":lcd " . expand("%:p:h") 

" VimTip 311: Open the folder containing the currently open file
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Occasionally, on windows, I have files open in gvim, that the folder for 
" that file is not open. This key map opens the folder that contains the 
" currently open file. The expand() is so that we don't try to open the 
" folder of an anonymous buffer, we would get an explorer error dialog in 
" that case.
 " if has("gui_running")
 "  if has("win32")
 "     " Open the folder containing the currently open file. Double <CR> at end
 "     " is so you don't have to hit return after command. Double quotes are
 "     " not necessary in the 'explorer.exe %:p:h' section.
 "     :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
 "   endif
 " endif
" 
" Tom.
" au GUIEnter * simalt ~x " Maximize window when enter vim


" " --------------------
" " Taglist
" " --------------------
" " F2:  Switch on/off TagList
" nnoremap <silent> <F2> :Tlist<CR>
" let Tlist_Use_Right_Window = 1
" " to make Taglist work with UnrealScript
" au FileType uc let Tlist_Ctags_Cmd = 'ctags.exe --options="' . $EX_DEV . '/vim/toolkit/cTags/.ctags"'
" let tlist_uc_settings = 'uc;c:class;f:function;i:simulated;e:event;s:state;x:exec;v:var'

" " ctags find the tags file from the current path instead of the path of
" " currect file
" au BufNewFile,BufEnter * set cpoptions+=d

" let Tlist_Show_One_File = 1 " Displaying tags for only one file~
" let Tlist_Sort_Type = "order" " sort by order or name
" let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
" let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
" let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
" let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
" let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
" let Tlist_Enable_Fold_Column = 1 " Don't Show the fold indicator column in the taglist window.
" let Tlist_Show_Menu = 1 " Display the tags menu.
" let Tlist_Exit_OnlyWindow = 1 " Close Vim if the taglist is the only window.

" " TagListTagName  - Used for tag names
" highlight MyTagListTagName gui=bold guifg=Black guibg=Orange 
" " TagListTagScope - Used for tag scope
" highlight MyTagListTagScope gui=NONE guifg=Blue 
" " TagListTitle    - Used for tag titles
" highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray 
" " TagListComment  - Used for comments
" highlight MyTagListComment guifg=DarkGreen 
" " TagListFileName - Used for filenames
" highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
" " Highlight of diff
" "highlight DiffAdd term=bold ctermbg=9 guibg=LightGreen
" "highlight DiffDelete term=bold ctermfg=9 ctermbg=11 gui=bold guifg=Red guibg=LightRed
" "highlight DiffChange term=bold ctermbg=13 guibg=LightBlue
" highlight DiffText term=reverse cterm=bold ctermbg=12 gui=bold guibg=Yellow

