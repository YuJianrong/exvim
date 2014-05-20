" vim_rc for ex utilities, YJR custom version
" ======================================================================================
" File         : _vimrc
" Author       : Wu Jie 
" Description  : 
" ======================================================================================


" set EX_DEV variable for linux
if has ("unix")
    let $EX_DEV='~/exvim/'
    let g:ex_toolkit_path = '~/exVim/toolkit'

"     " NOTE: mac is unix like system, but to use gawk,id-utils correctly, we need to manually set the export path.  
"     if has ("mac")
"         let $PATH='/usr/local/bin/:'.$PATH
"     endif
else " else if win32 or other system, just set the toolkit path.
    if !exists ( "g:ex_toolkit_path" )
        let g:ex_toolkit_path = $HOME.'/exVim/toolkit'
    endif
endif


" put your own user name here
let g:ex_usr_name = "Yu Jianrong"

let g:ex_help_text_on = 1

" ------------------------------------------------------------------ 
" Desc: exUtility
" ------------------------------------------------------------------ 

" edit current vimentry
nnoremap <unique> <leader>ve :call exUtility#EditVimEntry ()<CR>

" switch between edit and ex-plugin window
nnoremap <unique> <silent><Leader><Tab> :call exUtility#SwitchBuffer()<CR>

" close ex-plugin window when in edit window
nmap <unique> <silent><Leader><ESC> :call exUtility#SwitchBuffer()<CR><ESC>

" " change the original file jump method to this one
" nnoremap <unique> gf :call exUtility#QuickFileJump()<CR>

" map exUtility#Kwbd(1) to \bd will close buffer and keep window
nnoremap <unique> <Leader>bd :call exUtility#Kwbd(1)<CR>

" quick highlight
" NOTE: only gui mode can have alt, in terminal we have to use other mapping
if has("gui_running") " gui mode
    if has ("mac")
        nnoremap <unique> <silent> ¡ :call exUtility#Highlight_Normal(1)<CR>
        nnoremap <unique> <silent> ™ :call exUtility#Highlight_Normal(2)<CR>
        nnoremap <unique> <silent> £ :call exUtility#Highlight_Normal(3)<CR>
        nnoremap <unique> <silent> ¢ :call exUtility#Highlight_Normal(4)<CR>

        vnoremap <unique> <silent> ¡ :call exUtility#Highlight_Visual(1)<CR>
        vnoremap <unique> <silent> ™ :call exUtility#Highlight_Visual(2)<CR>
        vnoremap <unique> <silent> £ :call exUtility#Highlight_Visual(3)<CR>
        vnoremap <unique> <silent> ¢ :call exUtility#Highlight_Visual(4)<CR>

        nnoremap <unique> <silent> º :call exUtility#HighlightCancle(0)<CR>
    else
        nnoremap <unique> <silent> <M-1> :call exUtility#Highlight_Normal(1)<CR>
        nnoremap <unique> <silent> <M-2> :call exUtility#Highlight_Normal(2)<CR>
        nnoremap <unique> <silent> <M-3> :call exUtility#Highlight_Normal(3)<CR>
        nnoremap <unique> <silent> <M-4> :call exUtility#Highlight_Normal(4)<CR>

        vnoremap <unique> <silent> <M-1> :call exUtility#Highlight_Visual(1)<CR>
        vnoremap <unique> <silent> <M-2> :call exUtility#Highlight_Visual(2)<CR>
        vnoremap <unique> <silent> <M-3> :call exUtility#Highlight_Visual(3)<CR>
        vnoremap <unique> <silent> <M-4> :call exUtility#Highlight_Visual(4)<CR>

        nnoremap <unique> <silent> <M-0> :call exUtility#HighlightCancle(0)<CR>
    endif
else " terminal mode
    nnoremap <unique> <silent> <leader>h1 :call exUtility#Highlight_Normal(1)<CR>
    nnoremap <unique> <silent> <leader>h2 :call exUtility#Highlight_Normal(2)<CR>
    nnoremap <unique> <silent> <leader>h3 :call exUtility#Highlight_Normal(3)<CR>
    nnoremap <unique> <silent> <leader>h4 :call exUtility#Highlight_Normal(4)<CR>

    vnoremap <unique> <silent> <leader>h1 :call exUtility#Highlight_Visual(1)<CR>
    vnoremap <unique> <silent> <leader>h2 :call exUtility#Highlight_Visual(2)<CR>
    vnoremap <unique> <silent> <leader>h3 :call exUtility#Highlight_Visual(3)<CR>
    vnoremap <unique> <silent> <leader>h4 :call exUtility#Highlight_Visual(4)<CR>

    nnoremap <unique> <silent> <leader>h0 :call exUtility#HighlightCancle(0)<CR>
endif

nnoremap <unique> <silent> <Leader>0 :call exUtility#HighlightCancle(0)<CR>
nnoremap <unique> <silent> <Leader>1 :call exUtility#HighlightCancle(1)<CR>
nnoremap <unique> <silent> <Leader>2 :call exUtility#HighlightCancle(2)<CR>
nnoremap <unique> <silent> <Leader>3 :call exUtility#HighlightCancle(3)<CR>
nnoremap <unique> <silent> <Leader>4 :call exUtility#HighlightCancle(4)<CR>


" copy only full path name
nnoremap <unique> <silent> <leader>y1 :call exUtility#Yank( fnamemodify(bufname('%'),":p:h") )<CR>
" copy only file name
nnoremap <unique> <silent> <leader>y2 :call exUtility#Yank( fnamemodify(bufname('%'),":p:t") )<CR>
" copy full path + filename
nnoremap <unique> <silent> <leader>y3 :call exUtility#Yank( fnamemodify(bufname('%'),":p") )<CR>
" copy path + filename for code
nnoremap <unique> <silent> <leader>yb :call exUtility#YankBufferNameForCode()<CR>
" copy path for code
nnoremap <unique> <silent> <leader>yp :call exUtility#YankFilePathForCode()<CR>


" inherit
nnoremap <unique> <silent> <Leader>gv :call exUtility#ViewInheritsImage()<CR>
" mark (special) text
let g:ex_todo_keyword = 'NOTE REF EXAMPLE SAMPLE CHECK TIPS HINT'
let g:ex_comment_lable_keyword = 'DELME TEMP MODIFY ADD KEEPME DISABLE TEST ' " for editing
let g:ex_comment_lable_keyword .= 'ERROR DEBUG CRASH DUMMY UNUSED TESTME ' " for testing 
let g:ex_comment_lable_keyword .= 'FIXME BUG HACK OPTME HARDCODE REFACTORING DUPLICATE REDUNDANCY PATCH ' " for refactoring

" register buffer names of plugins.
let g:ex_plugin_registered_bufnames = ["__Tagbar__", "-MiniBufExplorer-","__Tag_List__","\[Lookup File\]", "\[BufExplorer\]"] 

" register filetypes of plugins.
let g:ex_plugin_registered_filetypes = ["ex_plugin","ex_project","taglist","nerdtree"] 

let g:ex_update_prompt_behaviour = "silent"

let g:ex_default_langs = ['c', 'cpp', 'c#', 'java', 'shader', 'python', 'vim', 'UnrealScript', 'math', 'wiki', 'ini', 'make', 'sh', 'batch', 'debug' ,'html', 'javascript', 'less', 'css', 'text', 'xml'] 

call add ( g:ex_default_langs, 'actionscript' ) 
call exUtility#AddLangMap ( 'exvim', 'actionscript', ['as'] )
call exUtility#AddLangMap ( 'ctags', 'actionscript', ['as'] )

call add ( g:ex_default_langs, 'lingo' ) 
call exUtility#AddLangMap ( 'exvim', 'lingo', ['ls'] )
call exUtility#AddLangMap ( 'ctags', 'lingo', ['ls'] )

call add ( g:ex_default_langs, 'uc' ) 
call exUtility#AddLangMap ( 'ctags', 'uc', ['uc'] )

" ------------------------------------------------------------------ 
" Desc: exTagSelect
" ------------------------------------------------------------------ 

nnoremap <silent> <leader><F7> :ExtsToggle<CR>
nnoremap <silent> <F7> :ExtsGoDirectly<CR>
nnoremap <unique> <silent> <Leader>ts :ExtsSelectToggle<CR>
nnoremap <unique> <silent> <Leader>tg :ExtsGoDirectly<CR>
nnoremap <unique> <silent> <Leader>] :ExtsGoDirectly<CR>

let g:exTS_backto_editbuf = 0
let g:exTS_close_when_selected = 1
let g:exTS_window_direction = 'bel'


" ------------------------------------------------------------------ 
" Desc: exGlobalSearch
" ------------------------------------------------------------------ 

function! g:ExCustom_exGs_KeepReg()
  let g:ExCustom_exGs__reg = @*
endfunction
function! g:ExCustom_exGs_restoreReg()
  let @* = g:ExCustom_exGs__reg
endfunction

nnoremap <silent> <leader><F8> :ExgsSelectToggle<CR>
nnoremap <silent> <F8> :ExgsGoDirectly<CR>
vnoremap <silent> <F8> :call g:ExCustom_exGs_KeepReg()<CR>gv"*y:GS <C-R>*<CR>:call g:ExCustom_exGs_restoreReg()<CR>
nnoremap <unique> <silent> <Leader>gs :ExgsSelectToggle<CR>
nnoremap <unique> <silent> <Leader>gq :ExgsQuickViewToggle<CR>
nnoremap <unique> <silent> <Leader>gg :ExgsGoDirectly<CR>
nnoremap <unique> <silent> <Leader>n :ExgsGotoNextResult<CR>
nnoremap <unique> <silent> <Leader>N :ExgsGotoPrevResult<CR>
nnoremap <unique> <Leader><S-f> :GS 

let g:exGS_backto_editbuf = 0
let g:exGS_close_when_selected = 0
let g:exGS_window_direction = 'bel'
let g:exGS_auto_sort = 1
let g:exGS_lines_for_autosort = 200

" ------------------------------------------------------------------ 
" Desc: exSymbolTable
" ------------------------------------------------------------------ 

nnoremap <silent> <leader><F6> :ExslToggle<CR>
nnoremap <silent> <F6> :ExslGoDirectly<CR>
nnoremap <unique> <silent> <Leader>ss :ExslSelectToggle<CR>
nnoremap <unique> <silent> <Leader>sq :ExslQuickViewToggle<CR>
nnoremap <unique> <silent> <Leader>sg :ExslGoDirectly<CR>
let g:exSL_SymbolSelectCmd = 'TS'
if has("gui_running") "  the <alt> key is only available in gui mode.
    if has ("mac")
        nmap <unique> Ò :ExslQuickSearch<CR>/
    else
        nmap <unique> <M-L> :ExslQuickSearch<CR>/
    endif
endif

" ------------------------------------------------------------------ 
" Desc: exJumpStack 
" ------------------------------------------------------------------ 

nnoremap <unique> <silent> <Leader>tt :ExjsToggle<CR>
nnoremap <unique> <silent> <Leader>tb :BackwardStack<CR>
nnoremap <unique> <silent> <Leader>tf :ForwardStack<CR>
nnoremap <unique> <silent> <BS> :BackwardStack<CR>

if has("gui_running") "  the <alt> key is only available in gui mode.
    noremap <unique> <M-Left> :BackwardStack<CR>
    noremap <unique> <M-Right> :ForwardStack<CR>
endif

" ------------------------------------------------------------------ 
" Desc: exCscope
" ------------------------------------------------------------------ 

" nnoremap <unique> <silent> <F2> :CSIC<CR>
nnoremap <unique> <silent> <Leader>ci :CSID<CR>
" nnoremap <unique> <silent> <F3> :ExcsParseFunction<CR>
nnoremap <unique> <silent> <Leader>cd :CSDD<CR>
nnoremap <unique> <silent> <Leader>cc :CSCD<CR>
nnoremap <unique> <silent> <Leader>cs :ExcsSelectToggle<CR>
nnoremap <unique> <silent> <Leader>cq :ExcsQuickViewToggle<CR>

let g:exCS_backto_editbuf = 0
let g:exCS_close_when_selected = 0
let g:exCS_window_direction = 'bel'
let g:exCS_window_width = 48



" ------------------------------------------------------------------ 
" Desc: exQuickFix
" ------------------------------------------------------------------ 

nnoremap <silent> <F9> :ExqfSelectToggle<CR>
nnoremap <silent> <leader><F9> :ExqfQuickViewToggle<CR>
nnoremap <unique> <silent> <leader>qf :ExqfSelectToggle<CR>
nnoremap <unique> <silent> <leader>qq :ExqfQuickViewToggle<CR>

let g:exQF_backto_editbuf = 0
let g:exQF_close_when_selected = 0
let g:exQF_window_direction = 'bel'


" ------------------------------------------------------------------ 
" Desc: exMacroHightlight
" ------------------------------------------------------------------ 

nnoremap <silent> <F4> :ExmhSelectToggle<CR>
nnoremap <unique> <silent> <Leader>aa :ExmhSelectToggle<CR>
nnoremap <unique> <silent> <Leader>ae :ExmhHL 1 <CR>
nnoremap <unique> <silent> <Leader>ad :ExmhHL 0 <CR>

" ------------------------------------------------------------------ 
" Desc: exProject
" ------------------------------------------------------------------ 

if has("gui_running") "  the <alt> key is only available in gui mode.
    if has ("mac")
        nmap <unique> Ø :EXProject<CR>:redraw<CR>/
        nnoremap <unique> <silent> ∏ :EXProject<CR>
    else
        nmap <unique> <M-O> :EXProject<CR>:redraw<CR>/
        nnoremap <unique> <silent> <M-P> :EXProject<CR>
    endif
endif

nnoremap <silent> <F5> :ExpjSelectToggle<CR>
nnoremap <silent> <leader><F5> :ExpjGotoCurrentFile<CR>
nnoremap <unique> <leader>ff :EXProject<CR>:redraw<CR>/\[\l*\]\zs.*
nnoremap <unique> <leader>fd :EXProject<CR>:redraw<CR>/\[\u\]\zs.*
" nnoremap <unique> <leader>fc :ExpjGotoCurrentFile<CR>
" let g:exPJ_window_width_increment = 50
" let g:exPJ_backto_editbuf = 1
" let g:exPJ_close_when_selected = 0
" let g:exPJ_window_width = 30

let g:exPJ_window_width_increment = 50
let g:exPJ_close_when_selected = 0
let g:exPJ_window_width =48 


" ------------------------------------------------------------------ 
" Desc: exBufExplorer 
" ------------------------------------------------------------------ 

nmap <unique> <F3> :EXBufExplorer <CR>:redraw<CR>
nnoremap <unique> <leader><F3> :EXAddBookmarkDirectly<CR>
nnoremap <unique> <silent> <leader>bs :EXBufExplorer<CR>
nnoremap <unique> <leader>bk :EXAddBookmarkDirectly<CR>

let g:exBE_backto_editbuf = 0
let g:exBE_close_when_selected = 0

" ------------------------------------------------------------------ 
" Desc: exMarksBrowser
" ------------------------------------------------------------------ 
nnoremap <silent> <leader><F2> :ExmbToggle<CR>

let g:exMB_backto_editbuf = 0
let g:exMB_close_when_selected = 0
let g:exMB_window_direction = 'bel'



" ------------------------------------------------------------------ 
" Desc: exEnvironmentSetting
" ------------------------------------------------------------------ 

" NOTE: The exEvironmentSetting must put at the end of the plugin settings. It may update the default settings of plugin above

let g:exES_project_cmd = 'EXProject'
" NOTE: if you have different programme path and settings, pls create your own vimrc under $HOME, and define these variables by yourself.
"       And don't forget sourced this rc at the end. 
"       web browser option: 'c:\Program Files\Mozilla Firefox\firefox.exe'
if has("gui_running")
    if has("win32")
        let g:exES_WebBrowser = 'chrome.exe'
        let g:exES_ImageViewer = $EX_DEV.'/tools/IrfanView/i_view32.exe'
    elseif has("mac") " NOTE: mac also has unix, so do it first
        let g:exES_WebBrowser = 'open'
        let g:exES_ImageViewer = 'open'
    elseif has("unix")
        let g:exES_WebBrowser = 'firefox'
    endif
endif

" exEnvironmentSetting post update
" NOTE: this is a post update environment function used for any custom environment update 
function g:exES_PostUpdate()

    " set lookup file plugin variables
	if exists( 'g:exES_LookupFileTag' )
        let g:LookupFile_TagExpr='"'.g:exES_LookupFileTag.'"'
        if exists(':LUCurFile')
            " NOTE: the second <CR>, if only one file, will jump to it directly.
            if maparg("gf")
                unmap gf
            endif
            nnoremap <unique> <silent> gf :LUCurFile<CR>
        endif
    endif

	" set visual_studio plugin variables
	if exists( 'g:exES_vsTaskList' )
		let g:visual_studio_task_list = g:exES_vsTaskList
	endif
	if exists( 'g:exES_vsOutput' )
		let g:visual_studio_output = g:exES_vsOutput
	endif
	if exists( 'g:exES_vsFindResult1' )
		let g:visual_studio_find_results_1 = g:exES_vsFindResult1
	endif
	if exists( 'g:exES_vsFindResult2' )
		let g:visual_studio_find_results_2 = g:exES_vsFindResult2
	endif

    " DISABLE { 
    " " set vimwiki
    " if exists( 'g:exES_wikiHome' )
    "     " clear the list first
    "     if exists( 'g:vimwiki_list' ) && !empty(g:vimwiki_list)
    "         silent call remove( g:vimwiki_list, 0, len(g:vimwiki_list)-1 )
    "     endif

    "     " assign vimwiki pathes, 
    "     " NOTE: vimwiki need full path.
    "     let g:vimwiki_list = [ { 'path': fnamemodify(g:exES_wikiHome,":p"), 
    "                 \ 'path_html': fnamemodify(g:exES_wikiHomeHtml,":p"),
    "                 \ 'html_header': fnamemodify(g:exES_wikiHtmlHeader,":p") } ]

    "     " create vimwiki files
    "     call exUtility#CreateVimwikiFiles ()
    " endif
    " } DISABLE end 
endfunction

"/////////////////////////////////////////////////////////////////////////////
" Other settings and special for other plugib
"/////////////////////////////////////////////////////////////////////////////

" ------------------------------------------------------------------ 
" Desc: snipMate
" ------------------------------------------------------------------ 

let g:snips_author = g:ex_usr_name
let g:snippets_dir = g:ex_toolkit_path . '/snippets/'

" ------------------------------------------------------------------ 
" Desc: NERD_tree 
" ------------------------------------------------------------------ 

let g:NERDTreeWinSize = exists('g:exPJ_window_width') ? g:exPJ_window_width : 30 


" VimTip #401: A mapping for easy switching between buffers
nnoremap <silent> <Leader><Right> :call g:GotoRightBuf()<CR>
nnoremap <silent> <Leader><Left> :call g:GotoLeftBuf()<CR>

function g:GotoLeftBuf()
    if !exUtility#IsRegisteredPluginBuffer(bufname("%"))
        exec "bp!"
        if g:exPJ_IsWindowOpened()
            exec "ExpjLocateCurrentFile"
        endif
    endif
endfunction

function g:GotoRightBuf()
    if !exUtility#IsRegisteredPluginBuffer(bufname("%"))
        exec "bn!"
        if g:exPJ_IsWindowOpened()
            exec "ExpjLocateCurrentFile"
        endif
    endif
endfunction
