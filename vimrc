set nocompatible

"***********************************************************************
"**************************Pathogen*************************************
"***********************************************************************
call pathogen#infect()          " Initialize pathogen
syntax on                       " Enable syntax highlighting
if has("autocmd")
  filetype plugin indent on
endif

"***********************************************************************
"*************************Misc Settings*********************************
"***********************************************************************
let mapleader = ","
set background=dark
colorscheme solorized

"***********************************************************************
"***********************General Settings********************************
"***********************************************************************
set number                      " Enable line numbering
set backspace=indent,eol,start  " Enable backspace key during insertmode
set history=1000                " :cmdline history 
set showcmd                     " Show incomplete cmds
set showmode                    " Show current mode
set visualbell                  " Mute sounds
set autoread                    " Reloads open files modified outsde vim
set hidden                      " Buffers exist in BG (multiple buffers)
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

"***********************************************************************
"**********************Formatting Settings******************************
"***********************************************************************
set autoindent                  " enable automagic indentationing
set smartindent                 "
set smarttab                    "
set shiftwidth=2                "
set softtabstop=2               "
set tabstop=2                   "
set expandtab                   "
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
