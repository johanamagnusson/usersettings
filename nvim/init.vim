set clipboard=unnamedplus
":set t_Co=256
:filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neomake/neomake'                  " async syntax checker
Plug 'Vimjas/vim-python-pep8-indent'    " PEP8 auto-indentation

call plug#end()
" NeoMake: -----------------------------------------------------------{{{
if index(keys(g:plugs), 'neomake') >= 0
    let g:neomake_python_enabled_makers = ['python', 'pylint']
        call neomake#configure#automake('w')
        call neomake#configure#automake('nw', 750)
        call neomake#configure#automake('rw', 1000)
endif " --------------------------------------------------------------}}}

:syntax on
:set background=dark
:colorscheme solarized
:set laststatus=2
:set statusline+=%y
:set number
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set statusline+=col:\ %c


:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
":nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"Highlights if text passes 80 columns
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

":command '/\S\zs\s\+$'

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
hi StatusLine guibg=Gray  guifg=Black ctermbg=253 ctermfg=238

:set cursorline
:hi CursorLine ctermbg=0
:hi LineNr ctermbg=8
:hi CursorLineNr ctermbg=0

au InsertEnter * hi StatusLine guibg=Black guifg=Red  ctermbg=253 ctermfg=167
au InsertEnter * hi CursorLine guibg=Pink  guifg=Black cterm=inverse

au InsertLeave * hi StatusLine guibg=Gray  guifg=Black ctermbg=253 ctermfg=238
au InsertLeave * hi CursorLine guibg=Green guifg=Black cterm=NONE ctermbg=0 ctermfg=NONE


set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
