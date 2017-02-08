"This file is part of the minos-core-settings package

"===============================================================================
"============================== General settings ===============================
"===============================================================================

if v:version < 700
    echoerr "This vimrc file use features than are only available on vim 7.0 or greater"
    finish
endif

if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set nocompatible      "breaks compatibility with vi, required
set modelines=0       "http://www.guninski.com/vim1.html
set noexrc            "don't use local version of .(g)vimrc, .exrc
set lazyredraw        "do not redraw the screen while macros are running. It
                      "improves performance
set ttyfast           "indicates a fast terminal connection
set history=100       "record last 100 commands, press 'q:' to see a new
                      "window (normal mode) with the full history
set t_Co=256          "set 256 colors. Make sure your console supports it.
                      "gnome-terminal, konsole and urxvt work well
set report=0          "report any changes
set nobackup          "git btw!
set nowritebackup     "bye .swp madness
set noswapfile
"set undofile          "persist the undo tree to a file
"set undodir='~/.vim/undo/'
set tabpagemax=100    "max open tabs at the same time
set autowrite
set autoread          "watch file changes by other programs
set encoding=utf-8    "utf is able to represent any character
set fileencoding=utf-8
set ruler             "show the cursor position all the time
set noerrorbells      "disable annoying beeps
set path+=**          "search through subdirectories
"set visualbell       "this one too
set wildmenu          "enhance command completion
set wildignore=*/.svn,CVS,*/.git,*/.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.swp,*/tmp/*
set wildignore=*.pdf,*.png,*.jpg,*.jpeg,*.mp3,*mp4,*.avi,*.mkv,*.mpeg,*.mpg,*.rm
set hidden            "allow open other file without saving current file
set autochdir         "change to the current directory
set winminheight=1    "never let a window to be less than 1px height
set winminwidth=1
set scrolloff=3       "show enough context
set sidescrolloff=2
set hlsearch          "highlight search
set incsearch         "search as you type
set ignorecase        "ignore case when searching
set smartcase         "ignores ignorecase when pattern contains uppercase characters"
set showcmd           "show the command being typed
set softtabstop=4     "vim sees 4 spaces as a tab
set shiftwidth=4
set showfulltag       "when autocompleting show as much as possible
set expandtab         "tabs mutate into spaces, if you wanna insert "real"
                      "tabs use Ctrl-v <tab> instance
set splitright        "split vertically to the right.
set splitbelow        "split horizontally below.
"set cursorline       "highlight the screen line of the cursor, slow!
set nostartofline     "keep the cursor on the same column
set nofsync           "improves performance, let OS decide when to flush disk
set showmatch         "show matching bracket
"set matchtime=5      "how many tenths of a second to blink
set diffopt+=iwhite   "ignore whitespace in diff mode
set cscopetag         "use both cscope and ctag for 'ctrl-]'
set csto=0            "gives preference to cscope over ctag
"set mousehide        "hide the mouse while typying
"set mouse=nv         "set the mouse to work in console mode
set foldenable!       "disable folding by default
"set foldmethod=indent "other options are marker|expr|manual
"set foldmarker={,}
"set clipboard=unnamed
"yanks go to clipboard, "+p to recover, only works on X11
if has ('unnamedplus') | set clipboard=unnamedplus | endif

set viminfo='100,<100,s10,h    "remember just a little
set backspace=indent,eol,start "backspace deletes as in other editors
set pastetoggle=<c-insert>     "pastetoggle, sane indentation on pastes
                               "doesn't work in most terminal emulators
                               ":set paste/nopaste are friends there
"print to html
let html_use_css       = 1
let html_dynamic_folds = 1

syntax on
filetype plugin indent on                 "enable filetype-specific plugins
setlocal omnifunc=syntaxcomplete#Complete "Omni-completion <C-x><C-o>

"====== Autoloads ======
if has("autocmd")
    "Go back to the position the cursor was on the last time this file was edited
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \|execute("normal '\"")|endif

    augroup vimrc "cannon be used with the above line, otherwise the cursor
                  "will jump randomly upon the first insert mode change
    autocmd VimEnter * nohls "turn off any existing search
    "browse documentation with <Enter>/<BS>
    autocmd filetype help :nnoremap <buffer><CR> <c-]>
    autocmd filetype help :nnoremap <buffer><BS> <c-T>

    "set foldmethod to manual after initial automatic indent recognition
    "autocmd BufReadPre  * setlocal foldmethod=indent
    "autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
    augroup END
endif

"====== Status Line ======
"mostly taken from http://github.com/ciaranm/dotfiles-ciaranm/raw/master/vimrc
set laststatus=2                             "always show statusline
set statusline=                              "init definition
set statusline+=%2*%-2n                      "buffer number
set statusline+=%h%1*%m%r%w%0*               "flags
set statusline+=%*\ %-.50F\                  "file name (full)
"if filereadable(expand("~/.vim/bundle/vim-cutils/plugin/cutils.vim"))
    "set statusline+=%-7{cutils#VCSInfo()}   "branch info
"endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}, "filetype
set statusline+=%{&encoding},                "encoding
set statusline+=%{&fileformat}]              "file format
if filereadable(expand("~/.vim/bundle/vimbuddy.vim/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()}          "cui o@o!
endif
"set statusline+=\ %{synIDattr(synID(line('.'),col('.'),1),'name')}
set statusline+=%=                           "right align
set statusline+=%2*%-8{strftime('%H:%M')}    "time
if filereadable(expand("~/.vim/bundle/vim-cutils/plugin/cutils.vim"))
    set statusline+=%-7{cutils#FileSize()}   "file size
endif
"set statusline+=%2*%-3b,0x%-8B\             "current char
"set statusline+=0x%-4B\                     "current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P       "offset
set statusline+=%-8.(%l,%c%V%)\ %P           "offset

"===============================================================================
"================================== Mappings ===================================
"===============================================================================

"=== Ctrl Mappings===
"windows
noremap  <c-k> <c-w>k
noremap  <c-j> <c-w>j
noremap  <c-l> <c-w>l
noremap  <c-h> <c-w>h
inoremap <c-k> <esc><c-w>k
inoremap <c-j> <esc><c-w>j
inoremap <c-l> <esc><c-w>l
inoremap <c-h> <esc><c-w>h

"tabs
map <c-t> <esc>:tabnew<cr>
map <c-tab> :tabnext<cr>
map <c-s-tab> :tabprevious<cr>
map [6^ :tabnext<cr>
map [5^ :tabprevious<cr>
map <c-w> :tabclose <cr>

"exit
map <c-x> :confirm qall<cr>

"=== Leader Mappings(,)==
let mapleader = ","

"m'ake
map <silent> <leader>m :make<cr>

"toggle numbering
map <silent> <leader>1 :set number!<cr>

"reload ~/.vimrc
map <leader>r :source $MYVIMRC<cr>

"resize windows
noremap <silent><leader>< :vertical resize -1<cr>
noremap <silent><leader>> :vertical resize +1<cr>
noremap <silent><leader>+ :resize +1<cr>
noremap <silent><leader>- :resize -1<cr>

"clear highlighted searches
nmap <silent> <leader>/   :nohlsearch<cr>

"use the repeat operator with a visual selection
vnoremap <leader>. :normal .<cr>

"repeat a macro on a visual selection of lines
vnoremap <leader>@ :normal @

"=== Tab Mappings ===
map <tab>c :cc<cr>
map <tab>n :cnext<cr>
map <tab>p :cprevious<cr>
"move between buffers
map <tab><space> :bnext<cr>

"=== Misc Mappings===
"let's switch these
nnoremap ' `
nnoremap ` '

"<esc> isn't really confortable, be carefull when pasting stuff
inoremap jj <esc>

"insert spaces in normal mode
noremap <space> i <esc>

"use <backspace> for deleting visual selections
xnoremap <bs> d
snoremap <bs> <bs>i

"edit at the end of the word
map e ea

"make Y consistent with D and C
nnoremap Y y$

"automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"quit and save faster
noremap zz :q!<cr>
noremap ss :w<cr>
noremap SS :%!sudo tee > /dev/null %<cr>

"execute current line, only vim scripting
"TODO: add support for other langs
"nnoremap ygl :<C-u><C-r>=getline('.')<cr><cr>
"ZZ :wq!

"overwrite these annoying commands
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
"cabbr W w
cabbr Q q
cabbr Q q
cabbr wQ wq
cabbr WQ wq
cabbr Wq wq
noremap <home> ^
noremap <end>  $

"this will work only in the gui version, most terminals are unable
"to determinate differences between <home> and <m-home>
noremap <m-home> gg
noremap <m-end>  G

"===============================================================================
"=================================== Plugins ===================================
"===============================================================================

if !isdirectory(expand("~/.vim/bundle/vundle/.git/"))
    if has("gui_running")
        "!git clone --depth=1 https://github.com/chilicuil/vundle-legacy.git ~/.vim/bundle/vundle
        silent !git clone --depth=1 https://github.com/chilicuil/vundle.git ~/.vim/bundle/vundle
        if isdirectory(expand("~/.vim/bundle/vundle/.git/"))
            echon "Run :BundleInstall to finish the installation"
        endif
    else
        echon "Setting up vundle, this may take a while, wanna continue? (y/n): "
        if nr2char(getchar()) ==? 'y'
            "!git clone --depth=1 https://github.com/chilicuil/vundle-legacy.git ~/.vim/bundle/vundle
            silent !git clone --depth=1 https://github.com/chilicuil/vundle.git ~/.vim/bundle/vundle
            silent !printf "Installing vundle plugins ..."
            silent !vim -es -u "${MYVIMRC}" -c "BundleInstall" -c qa
        endif
    endif
endif

if isdirectory(expand("~/.vim/bundle/vundle/"))
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()

    "====github====
    Bundle 'chilicuil/vundle' "vim plugin manager
    "define additional text :h objects
    Bundle 'paradigm/TextObjectify' , { 'on': 'delay' } "triggered by CursorHold/CursorMoved hooks
    Bundle 'edsono/vim-matchit'    ", { 'on': 'delay 10' }, match pairs {,(,',etc
    Bundle 'gregsexton/MatchTag'   ", { 'on': 'delay 10' }  match even more pairs xml|html tags
    "complex alternative, requires +python
    "Bundle 'valloric/MatchTagAlways'
    Bundle 'mhinz/vim-hugefile'  "optimizer for huge files, disable expansive vim features
    Bundle 'chilicuil/file-line' "jump to line on startup, eg: $ vim file:23 => goes to the 23rd line
    Bundle 'pbrisbin/vim-mkdir'  "create missing directories on saving
    Bundle 'chilicuil/gnupg.vim' "pgp viewer
    Bundle 'henrik/vim-indexed-search' , { 'on': 'delay' } "count and index search results
    Bundle 'chilicuil/vimbuddy.vim'    "o@o/
    Bundle 'chilicuil/securemodelines' "disable insecure vim options
        "let g:secure_modelines_verbose=1
    "pastebin client
    Bundle 'chilicuil/vim-sprunge'  , { 'on': ['<Plug>Sprunge'] }
        map <leader>s <Plug>Sprunge
        let g:sprunge_flush_left = 1
    "checksum generator
    Bundle 'chilicuil/vim-checksum' , { 'on': ['<Plug>Checksum'] }
        map <leader>c <Plug>Checksum
    "whitespace heater
    Bundle 'ntpeters/vim-better-whitespace' , { 'on': 'delay' }
        set list
        set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

    Bundle 'mhinz/vim-signify' "git|svn|etc modification viewer
        let g:signify_vcs_list    = [ 'git' ]
        let g:signify_sign_add    = '+'
        let g:signify_sign_change = '~'
        let g:signify_sign_delete = '-'
    Bundle 'mbbill/undotree' , { 'on': 'UndotreeToggle'} "undo navigation bar
        map <leader>u :UndotreeToggle<cr>

    Bundle 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' } "file viewer
        let g:NERDTreeWinPos      = 'right'
        let g:NERDTreeWinSize     = 25
        let g:NERDTreeMouseMode   = 3
        map <silent> <leader>n    :NERDTreeToggle<cr>
        "let g:NERDTreeMapOpenSplit="-"
        "let g:NERDTreeMapOpenVSplit="|"
    "toggle comments
    Bundle 'scrooloose/nerdcommenter' , {'on': ['<Plug>NERDCommenterToggle', '<Plug>NERDCommenterSexy'] }
       map <leader>c<space> <Plug>NERDCommenterToggle
       map <leader>cs       <Plug>NERDCommenterSexy
       let g:NERDCustomDelimiters  = {'mkd': { 'left': '<!--', 'right': '-->'}}

    "class/function/var browser
    Bundle 'majutsushi/tagbar' , { 'on': 'TagbarToggle', 'do': 'wget --no-check-certificate https://raw.githubusercontent.com/chilicuil/learn/master/python/tools/mkd2ctags && chmod +x mkd2ctags' }
        let g:tagbar_left         = 1
        let g:tagbar_width        = 25
        let g:tagbar_type_mkd     = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' : '~/.vim/bundle/tagbar/mkd2ctags',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
                \ 's:sections',
                \ 'l:links',
                \ 'i:images'
            \ ],
            \ 'sort': 0
        \ }
        map <silent> <leader>l    :TagbarToggle<cr>

    "fuzzy file|buffer|etc finder
    Bundle 'kien/ctrlp.vim'      , { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMixed'] }
    "Bundle 'ctrlpvim/ctrlp.vim' , { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMixed'] } "active fork
        "let g:ctrlp_cache_dir          = $HOME.'/.cache/ctrlp'
        let g:ctrlp_use_caching         = 1
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_working_path        = 0
        let g:ctrlp_match_window        = 'bottom,order:ttb,min:1,max:10,results:100'
        let g:ctrlp_extensions          = ['smarttabs']
        " let g:ctrlp_map               = '<leader>f'
        map <leader>f                   :CtrlP<cr>
        map <leader>b                   :CtrlPBuffer<cr>
        if has('python') | let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } | endif
        if executable("ag")
            let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup
            \ --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store
            \ --ignore *.pyc --ignore *.mp3 --ignore *.png --ignore *.jpg -g ""'
        endif
    Bundle 'FelikZ/ctrlp-py-matcher'  , { 'on': 'delay 5' }
    Bundle 'DavidEGx/ctrlp-smarttabs' , { 'on': ['CtrlPSmartTabs'] }
        let g:ctrlp_smarttabs_reverse        = 0
        let g:ctrlp_smarttabs_modify_tabline = 0
        map <leader>t :call vundle#load('ctrlp.vim')<cr>:CtrlPSmartTabs<cr>
    "vim motions on steroids
    Bundle 'Lokaltog/vim-easymotion'  , { 'on': ['<Plug>(easymotion-prefix)'] }
        "let g:EasyMotion_leader_key  = '<leader><leader>'
        map <leader><leader>          <Plug>(easymotion-prefix)
        let g:EasyMotion_keys         = 'asdfghjklqwertyuiopzxcvbnm'

    Bundle 'chilicuil/snipmate.vim' , { 'on': 'insert' } "snippet support
        let g:snips_author            = "Javier Lopez"
        let g:snips_authorEmail       = "m@javier.io"
        let g:snippets_dir            = "~/.vim/bundle/vim-snippets/snipmate/"
        let g:snipmate_default_choice = 1
    Bundle 'chilicuil/vim-snippets' , { 'on': 'insert' } "my snippet definitions
    Bundle 'Shougo/neocomplcache'   , { 'on': 'insert' } "autocompletion
        let g:neocomplcache_enable_at_startup              = 1
        let g:neocomplcache_max_list                       = 10
        let g:neocomplcache_max_menu_width                 = 10
        let g:neocomplcache_auto_completion_start_length   = 4
        let g:neocomplcache_manual_completion_start_length = 4
        let g:neocomplcache_enable_auto_select             = 1
        let g:neocomplcache_enable_auto_delimiter          = 1
        let g:neocomplcache_disable_auto_complete          = 0
        let g:neocomplcache_enable_wildcard                = 1
        let g:neocomplcache_enable_caching_message         = 1

    "colorscheme manager
    Bundle 'chilicuil/nextCS' , { 'on': ['<Plug>NextCS', '<Plug>PreviousCS'] }
        map <F12> <Plug>NextCS
        map <F11> <Plug>PreviousCS
    Bundle 'chilicuil/vim-colors' "my colorschemes
        if isdirectory(expand("~/.vim/bundle/vim-colors/"))
            if has ('gui_running')
                set background=dark
                set gfn=Inconsolata\ Medium\ 10
                "set gfn=Monaco\ 9
                "set gfn=Monospace\ 9
                silent! colorscheme hemisu
            else
                set background=dark
                silent! colorscheme hemisu
            endif
        endif

    "align columns on characters
    Bundle 'junegunn/vim-easy-align' , { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
        "command! -nargs=* -range -bang Align
        "\ <line1>,<line2>call easy_align#align('<bang>' == '!', 0, '', <q-args>)
        command! -nargs=* -range -bang Align <line1>,<line2>EasyAlign
        vmap . <Plug>(EasyAlignRepeat)
        nmap <leader>a <Plug>(EasyAlign)

    Bundle 'chilicuil/vim-cutils' "random helpers
        "cutils#VCSInfo
        "cutils#FileSize
        "cutils#CUSkel, create own plugin?
        "cutils#CUSetProperties
        let g:cutils_map_longlines      = '<leader>cul'
        let g:cutils_map_appendmodeline = '<leader>am'
    "my ways
    Bundle 'chilicuil/x-modes' , { 'on': [ '<Plug>XDevelopmentMode', '<Plug>XWriteMode', 'XWriteMode', '<Plug>XPresentationMode'] }
        map <silent> <leader>D <Plug>XDefaultMode
        map <silent> <leader>d <Plug>XDevelopmentMode
        map <silent> <leader>w <Plug>XWriteMode
        map <silent> <leader>p <Plug>XPresentationMode
    if v:version < 704 | Bundle 'google/vim-ft-go' | endif

    Bundle 'scrooloose/syntastic' , { 'on': 'delay' } "syntax checker
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list            = 1
        let g:syntastic_check_on_open            = 1
        let g:syntastic_check_on_wq              = 0
        let g:syntastic_python_python_exec       = "python2"
        let g:syntastic_html_tidy_exec           = "tidy"
        let g:syntastic_auto_jump                = 2
        "let g:syntastic_error_symbol            = "E!"
        "let g:syntastic_warning_symbol          = "W"

    Bundle 'mileszs/ack.vim' , { 'on': ['Ack'] } "grep|ag search integration
        "let g:ackpreview = 1
        let g:ackhighlight = 1
        let g:ack_mappings = { "O": "<CR>zz", "o": "<CR>zz:ccl<CR>", "p": "<CR>zz<C-W>p", "i": "<C-W><CR><C-W>x<C-W>p", }
        command! -nargs=* Grep Ack! <q-args>
        nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>
        if executable("ag")
            let g:ackprg = "ag --vimgrep"
        else
            let g:ackprg = "grep -rni --exclude-dir={.git,.svn,.bzr,.hg,.pc,CVS} --binary-files=without-match . -e"
        endif

    "===http://www.vim.org/scripts/===
    Bundle 'surround.vim'    , { 'on': 'insert' } "text :h objects on steroids
        " ds"   => delete surrounding quotes
        " cs"'  => replace surrounding quotes with single quotes
        " ysiw' => wrap word in surrounding single quotes
    Bundle 'delimitMate.vim' , { 'on': 'insert' } "autocomplete pairs
        autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
    Bundle 'repeat.vim'      , { 'on': 'delay'  } " .|repeat support for plugins

    "===experimental===
    Bundle 'chilicuil/goyo.vim' , { 'on': '<Plug>Goyo' } "zen write mode
        map <leader>y <Plug>Goyo
        "let g:goyo_width         = 160
        "let g:goyo_margin_top    = 5
        "let g:goyo_margin_bottom = 5
        "function! g:goyo_before()
            "colorscheme jellybeans
        "endfunction
        "function! g:goyo_after()
            "colorscheme hemisu
        "endfunction
        "let g:goyo_callbacks = [function('g:goyo_before'), function('g:goyo_after')]

    "documentation viewer (K in normal mode)
    Bundle 'gastonsimone/vim-dokumentary' "replace it, cannot load on demand
    Bundle 'wting/gitsessions.vim' , { 'on': ['GitSessionSave', 'GitSessionDelete'] }
        command! -nargs=* SessionSave   GitSessionSave
        command! -nargs=* SessionDelete GitSessionDelete
    Bundle 'tmux-plugins/vim-tmux'  "syntax file
    Bundle 'zah/nimrod.vim'         "syntax file
    Bundle 'chilicuil/vim-markdown' "syntax file
    Bundle 'ap/vim-css-color'       "colorize #hex, rgb tags
    Bundle 'alvan/vim-closetag' , { 'on': 'insert' } "autoclose xml|html tags
        let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

    Bundle 'KabbAmine/lazyList.vim', { 'on': 'delay' } "helps creating lists
    "Bundle 'chilicuil/lazyList.vim', { 'on': 'delay' }
        let g:lazylist_maps = [ 'gl', { 'l': '', '1': '%1% ', '-': '- ', '*': '* ' } ]
    Bundle 'junegunn/vader.vim' , { 'on': ['Vader'] }   "tdd for vim plugin development
    Bundle 'Olical/vim-enmasse' , { 'on': ['EnMasse'] } "edit quicklist results, grep/ag
    "Bundle 'Two-Finger/hardmode' "use vim the right way
        "let g:hardmode = 1
        "nnoremap <Leader>H <Esc>:call ToggleHardMode()<CR>

    "===discarted===
    "Bundle 'chilicuil/taglist.vim'         "tagbar looks better
    "Bundle 'FindMate'                      "ctrlp.vim ftw!
    "Bundle 'vim-scripts/AutoComplPop'      "neocomplcache is better
        "let g:acp_behaviorKeywordLength    = 4
        "let g:acp_mappingDriven            = 1
        "let g:acp_completeOption           = '.,w,b,t,k,i,d'
        "let g:acp_completeoptPreview       = 1
        "let g:acp_behaviorSnipmateLength   = 2
        "let g:acp_behaviorPythonOmniLength = -1
    "Bundle 'Lokaltog/vim-powerline'        "prefer my own powerline =)
        "let g:Powerline_cache_enabled = 1
        "let g:Powerline_symbols = 'compatible' "compatible, unicode, fancy
        "let g:Powerline_theme = 'default' "default, skwp
        "let g:Powerline_stl_path_style = 'short' "relative, filename, short, full
        "call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')
        "call Pl#Theme#ReplaceSegment('scrollpercent', 'fileinfo')
    "Bundle 'tpope/vim-fugitive'            "too slow
    "Bundle 'godlygeek/csapprox'            "pretty but slow
    "Bundle 'mattn/webapi-vim'              "sprunge ftw!
    "Bundle 'mattn/gist-vim'                "sprunge ftw!
    "Bundle 'goldfeld/vim-seek'             "easymotion.vim ftw!
    "Bundle 'akiomik/git-gutter-vim'        "doesn't work
    "Bundle 'airblade/vim-gitgutter'        "doesn't work
    "Bundle 'luxflux/vim-git-inline-diff'   "too slow
    "Bundle 'terryma/vim-multiple-cursors'  "nice idea but too slow
    "Bundle 'tomtom/tcomment_vim' , { 'on': '<Plug>TComment_<c-_><c-_>' }
    "    map <leader>c<space> <Plug>TComment_<c-_><c-_>
    "    map <leader>cs       <Plug>TComment_<c-_><c-_>
    "    let g:tcommentOptions = {'whitespace': 'no'} "nerdcommenter ftw!
    "Bundle 'lilydjwg/colorizer' "way slower than 'ap/vim-css-color'
    "Bundle 'wellle/tmux-complete.vim' , { 'on': 'insert' } "too slow
endif

"===============================================================================
"==================================Extra-notes==================================
"===============================================================================

" ==Movement==
" "Ctrl-f" scrolls forward one screen
" "Ctrl-b" scrolls backward one screen
" "Ctrl-d" scrolls backward half screen
" "Ctrl-u" scrolls backward half screen
" "z-<CR>" moves current line to top of screen and scroll
" "z-." moves current line to center of screen and scroll
" "z--" moves current line to bottom of screen and scroll
" "H" moves to the top line on the screen
" "M" moves to the middle line on the screen
" "L" moves to the last line on the screen
" "(" moves to the beginning of the current sentence
" ")" moves to the beginning of the next sentence
" "{" moves to the beginning of the current paragraph
" "}" moves to the beginning of the next paragraph
" "[[" moves to the beginning of the current section
" "]]" moves to the beginning of the next section
" "w" moves the cursor forward one word
" "b" moves backward to the start of the previous word.
" "e" moves to the next end of a word
" "ge" moves to the previous end of a word.
" "gg" puts the cursor in the first line.
" "G" puts the cursor in the last line
" "'0" returns to the last mark
" "Ctrl-w f" goes to the file under the cursor
" "Ctrl-]" jumps to the function's definition :tags
" "Ctrl-T" jumps back

" ==Text objects==
" "daw" deletes word under cursor, see :h text-objects, (c)hange & (y)ank
" "caw" changes word under cursor  ======================================
" "yaw" copies word under cursor   ======================================
" "das" deletes sentence
" "dap" deletes paragraph
" "da{" deletes {} block
" "di{" deletes text inside {}
" "da[" deletes [] block
" "di[" deletes text inside []
" "da<" deletes <> block
" "di<" deletes text inside <>
" "da"" deletes "" block
" "di"" deletes text inside ""
" "dat" deletes tag block (html, xml)
" "dit" deletes text inside tag words
" ":%d" deletes all the lines in a file

" ==Search & reemplace==
" ":%s/\s\+$//" removes all whitespaces at the end of every line
" ":%s/old/new/gc" it'll confirm each replacement before it's made
" ":g/old/s//new/gc" same to the above sentence
" ":g/\(old\) \(stuff\)/s//\2 \1/gc" changes "old stuff" to "stuff old"
" ":%s/\(old\) \(stuff\)/\2 \1/gc" same to the above sentence
" ":1,10s/.*/(&)/" surrounds each line from 1 to 10 with parenthesis
" "%s/yes, doctor/\uyes, \udoctor/gc" changes 'yes doctor' to 'Yes, Doctor'
" ":%s/\([:.]\)  */\1  /g" replaces one or more spaces following a period
"                          or a colon with two spaces
" ":g/^[ tab]*$/d" deletes all blank lines, plus any lines that contain
"                  only whitespace
" ":%s/.*/\U&/"
" ":%s/./\U&/g" changes every letter in a file to uppercase
" ":windo %s/old/new/g" replaces 'old' with 'new' in all windows
" ":bufdo set nonumber" set nonumber option in all buffers
" ":g/^/move 0" reverses the order of lines in a file
" ":g!/^[[:digit:]]/move $" for any line that doesn't begin with a number,
"                           moves the line to the end of the file
" "&" repeats the last substitution
" ":%&g" repeats the last substitution globally
" "/\<thi" matches all the words who start with "thi" like 'things'
" "/ing\>" matches all the words who end with "ing", like 'using'
" ":vimgrep /\%1l/ **/filename" find all files given a name at any depth
"                               in the current directory or below
" ":copen" open the list generated by vimgrep
" "f<character>" searches for the character
" ";" goes to the next match
" "," goes to the previous match
" "F<character>" searches to the left.
" "d/key-word" deletes from the cursor to the key-word, it also
"              works with ?
" "[I" finds global identifiers in included files

" ==Edit==
" "J" joins two lines together
" "." repeats the last change on --insert-- mode
" "~" changes case of the character under the cursor
" "gqG" gives format to the whole file
" "]s" moves to next misspelled word after the cursor
" ":e!" goes to the latest saved file version
" "g Ctrl-g" counts the words in the whole file
" "+p    " paste text from system clipboard
" "+yy   " copy from vim to the system clipboard
" "+dd   " cut from vim to the sysyem clipboard

" ==Misc stuff==
" "K" goes to the man page of the word under the cursor
" "Ctrl-w r" rotates windows
" "Ctrl-w x" rotates windows and cursor focus at the same time
" "Ctrl-w T" moves the current window to a new tab
" "Ctrl-w H | J | K | L" moves the current window to the left,
"                        bottom, top and right of the screen
" "vim + file" opens file at last line
" "find . | vim -" you can take the output of any command and
"                  send it into a vim session
" ":sball" opens all buffers in new windows
" ":ped file" open in a help window a second file
" ":help 42"
" ":help quotes"
" ":help holy-grail"
" "zo" Open a folder
" "zO" Open a folder recursively
" "zc" Close a folder
" "zC" Close a folder recursively
" ":map" List maps
" ":registers" Show what is in each register
" "set all" show all the options
" "q/" gives the search history window
" "q:" gives the comand history window
" ":%! nl -ba" numbers all lines in a file
" ":%! cat -n %" same as above
" Vim can be suspended like any other program with Ctrl-z and
" be restarted with --fg--
