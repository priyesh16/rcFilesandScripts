"=== evoke a web browser
function! Browser ()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ ]*")
    :if line==""
      let line = matchstr (line0, "ftp[^ ]*")
    :endif
    :if line==""
      let line = matchstr (line0, "file[^ ]*")
    :endif
    let line = escape (line, "#?&;|%")
    :if line==""
      let line = "\"" . (expand("%:p")) . "\""
    :endif
    exec ':silent !firefox ' . line
endfunction
map \w :call Browser ()<CR> 

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

fun FunctionName()
    "set a mark at our current position
    normal mz

    "while foundcontrol == 1, keep looking up the line to find something that
    "isn't a control statement
    let foundcontrol = 1
    while (foundcontrol)
        "find the previous '{' and get the line above it
        ?{
        normal k0
        let tempstring = getline(".")

            "if the line matches a control statement, set found control to 1 so
            "we can look farther back in the file for the beginning of the
            "actual function we are in
            if(match(tempstring, "while") >= 0)
                let foundcontrol = 1
            elseif(match(tempstring, "for") >= 0)
                let foundcontrol = 1
            elseif(match(tempstring, "if") >= 0)
                let foundcontrol = 1
            elseif(match(tempstring, "else") >= 0)
                let foundcontrol = 1
            elseif(match(tempstring, "try") >= 0)
                let foundcontrol = 1
            elseif(match(tempstring, "catch") >= 0)
                let foundcontrol = 1
            else
                normal `z
                let foundcontrol = 0
                return tempstring
            endif
    endwhile
    return tempstring
endfun

filetype plugin on
filetype plugin indent on
set matchpairs=(:),[:],{:},\<:\>
set tabstop=4                " tabstops are 4 (for all code)
set shiftwidth=4                " shiftwidth is 4
set softtabstop=4
set noexpandtab           " expand tabs to spaces
set showmatch           " briefly jump to matching brackets
set matchtime=3		"decrease time to match above"
set hlsearch
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set incsearch
set textwidth=80
set printdevice=dollar
set backspace=indent,eol,start
set mouse=a

"if column is greater than 80 show error 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set autoindent
syntax enable
set dictionary=/usr/share/dict/scowl-6/final/english-words.10,/usr/share/dict/scowl-6/final/english-words.20,/usr/share/dict/scowl-6/final/english-words.35,/usr/share/dict/scowl-6/final/english-words.40,/usr/share/dict/scowl-6/final/english-words.50,/usr/share/dict/scowl-6/final/english-words.55,/usr/share/dict/scowl-6/final/english-words.60,/usr/share/dict/scowl-6/final/english-words.70,/usr/share/dict/scowl-6/final/english-words.80,/usr/share/dict/scowl-6/final/english-words.95,/usr/local/WordNet-2.1/dict/adj.exc,/usr/local/WordNet-2.1/dict/adv.exc,/usr/local/WordNet-2.1/dict/cntlist,/usr/local/WordNet-2.1/dict/cntlist.rev,/usr/local/WordNet-2.1/dict/data.adj,/usr/local/WordNet-2.1/dict/data.adv,/usr/local/WordNet-2.1/dict/data.noun,/usr/local/WordNet-2.1/dict/data.verb,/usr/local/WordNet-2.1/dict/frames.vrb,/usr/local/WordNet-2.1/dict/index.adj,/usr/local/WordNet-2.1/dict/index.adv,/usr/local/WordNet-2.1/dict/index.noun,/usr/local/WordNet-2.1/dict/index.sense,/usr/local/WordNet-2.1/dict/index.verb,/usr/local/WordNet-2.1/dict/log.grind.2.1,/usr/local/WordNet-2.1/dict/noun.exc,/usr/local/WordNet-2.1/dict/sentidx.vrb,/usr/local/WordNet-2.1/dict/sents.vrb,/usr/local/WordNet-2.1/dict/verb.Framestext,/usr/local/WordNet-2.1/dict/verb.exc
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Display_Prototype = 1

"set csprg='/ws/on10-patch-tools/onbld/bin/i386/cscope-fast'
set csprg='/opt/csw/bin/cscope'
"" Cscope specific
"" make sure to add cs connections using :cs add


" Cscope settings
"if has("cscope")
    " quickfix window usage
"   set cscopequickfix=s-,c-,d-,i-,t-,e-
    " :tag and the like use :cstag
"   set cscopetag
    " first search cscope, than tags file
"   set cscopetagorder=0
"   set nocsverb
    " add any database in current directory
   if filereadable("cscope.out")
       cs add cscope.out $PWD
       " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
   endif
"   set csverb
"ndif

" cscope find
" 0 or s: Find this C symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file

nmap vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

nmap ws :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap wg :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap wc :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap wt :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap we :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap wi :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap wd :scs find d <C-R>=expand("<cword>")<CR><CR>

"emacs like shell plugin
nmap \sh : source ~/.vim/vimsh/vimsh.vim<CR>

"some styling
set listchars=tab:➝\ ,extends:#,nbsp:.
set textwidth=80
set shiftwidth=3
set iskeyword=@,48-57,_,192-255
" Have a split window take full screen always!
" set winheight=999
"source /.vim/ftplugin/gtd.vim

nmap \gn :GtdNewTask<CR>
nmap +   :GtdMarkDone<CR><CR>
nmap -   :GtdMarkUnDone<CR><CR>

" map for toggling paste mode
map <F3> :set paste!<CR><Bar>:echo "Paste Mode: " . strpart("OffOn", 3 * &paste, 3)<CR>

" map to toggle spell check
" some useful keys for spellchecking
"  ]s       - forward to misspelled/rare/wrong cap word
"  [s       - backwards
"
"  ]S       - only stop at misspellings
"  [S       - in other direction
"
"  zG       - accept spelling for this session
"  zg       - accept spelling and add to personal dictionary
"
"  zW       - treat as misspelling for this session
"  zw       - treat as misspelling and add to personal dictionary
"
"  z=       - show spelling suggestions
"
"  :spellr  - repeat last spell replacement for all words in window
" Other options to consider
" they were using white on white
""  highlight PmenuSel ctermfg=black ctermbg=lightgray

" limit it to just the top 10 items
""  set sps=best,10

map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
if &filetype == 'mail' || &syntax == 'mail'
    :set spell
    :echomsg &spell
endif

