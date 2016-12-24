":set t_Co=256
:filetype plugin indent on
:syntax on
:set background=dark
:colorscheme molokai
:set laststatus=2
:set statusline+=%y
:set number
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set statusline+=col:\ %c

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>

"Highlights if text passes 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

:command  '/\S\zs\s\+$'

"Highlights trailing whitespace
":set hlsearch
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"match ExtraWhitespace /\S\zs\s\+$/

:set statusline=%t       "tail of the filename
:set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
:set statusline+=%{&ff}] "file format
:set statusline+=%h      "help file flag
:set statusline+=%m      "modified flag
:set statusline+=%r      "read only flag
:set statusline+=%y      "filetype
:set statusline+=%=      "left/right separator
:set statusline+=%c,     "cursor column
:set statusline+=%l/%L   "cursor line/total lines
:set statusline+=\ %P    "percent through file

