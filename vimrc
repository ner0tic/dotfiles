set nocompatible

"***********************************************************************
"**************************Pathogen*************************************
"***********************************************************************
runtime available-bundles/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()          " Initialize pathogen

"***********************************************************************
"*************************Misc Settings*********************************
"***********************************************************************
syntax on                       " Enable syntax highlighting
if has("autocmd")
  filetype plugin indent on
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript	" Treat json files as js files
endif
let mapleader = ","
set background=dark
colorscheme solorized

"***********************************************************************
"***********************General Settings********************************
"***********************************************************************
set number                      " Enable line numbering
set cursorline					" Highlight current line	
set ruler						" Show the cursor position
set backspace=indent,eol,start  " Enable backspace key during insertmode
set esckeys						" Allow cursor keys in insertmode
set history=1000                " :cmdline history 
set showcmd                     " Show incomplete cmds
set showmode                    " Show current mode
set visualbell                  " Mute sounds
set autoread                    " Reloads open files modified outsde vim
set hidden                      " Buffers exist in BG (multiple buffers)
set clipboard=unnamed			" Use OS clipboard
set nostartoflin				" Disable moving cursor to start of line
au FocusLost * :wa              " Save open files when widow loses focus

"***********************************************************************
"*************************Search Settings*******************************
"***********************************************************************
set incsearch                   " Instant results
set hlsearch                    " Highlight search results
set viminfo='100, f1            " Save up to 100 marks, enable capital marks
set showmatch                   " 
set smartcase                   " If caps, watch case
set ignorecase                  " If all lowercase, ignore case
set gdefault					" Add g flag to searches defaultly

"***********************************************************************
"**********************Formatting Settings******************************
"***********************************************************************
set autoindent                  " enable automagic indentationing
set smartindent                 "
set smarttab                    "
set shiftwidth=2                "
set softtabstop=2               "
set tabstop=2                   " Make tabs as wide as two spaces
set expandtab                   "
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_	" Show "invisible" chars
abbrev wrap set wrap nolist linebreak
abbrev nowrap set nowrap nolist nolinebreak

"***********************************************************************
"************************Folding Settings*******************************
"***********************************************************************
set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold depth
set nofoldenable                " Disable folding defaultly

"***********************************************************************
"**********************Completion Settings******************************
"***********************************************************************
set wildmode=list:longest
set wildmenu                    " Ctrl-n for next, ctrl-p for previous
set wildignore=*.o,*.obj,*.class,*.a,*.so,*.jpg,*.png,*.gif,*.psd,*.xpm,*.swp,*~,.svn,.git,cvs,*vim/backups*,*DS_Store*,log/**,tmp/**

"***********************************************************************
"***********************Scrolling Settings******************************
"***********************************************************************
set scrolloff=8                 " Start scrolling when x lines from margins
set sidescrolloff=15            "
set sidescroll=1                "

"***********************************************************************
"*************************Swap Settings*********************************
"***********************************************************************
set noswapfile                  " Disable swap
set nobackup                    " Disable autobackups (see persistent undo)
set nowb                        "

"***********************************************************************
"********************Persistent Undo Settings***************************
"***********************************************************************
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups      " Set directory to store backups
set undofile

"***********************************************************************
"************************PHPcs Settings*********************************
"***********************************************************************
let Vimphpcs_standard='UseAllFive'
