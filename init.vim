call plug#begin("~/.vim/plugged")
  " Theme
  Plug 'sainnhe/gruvbox-material'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-coverage']

  " Syntax plugins

  " Plug 'pangloss/vim-javascript'
  " Plug 'othree/yajs.vim'
  " Plug 'HerringtonDarkholme/yats.vim'

  " TypeScript Highlighting
  " Plug 'leafgarland/typescript-vim'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'maxmellon/vim-jsx-pretty'
  " Plug 'jparise/vim-graphql'
  
  Plug 'sheerun/vim-polyglot'
  
  " Git Plugins
  Plug 'mhinz/vim-signify'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

" Disable strange Vi defaults.
set nocompatible

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Ignore case when searching.
set ignorecase

" Enable mouse for scrolling and window resizing.
set mouse=a

" shorten update time default is 4000
set updatetime=2000

let mapleader=","

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" set conceallevel=1
" let g:typescript_conceal_function             = "ƒ"
" let g:typescript_conceal_null                 = "ø"
" let g:typescript_conceal_undefined            = "¿"
" let g:typescript_conceal_this                 = "@"
" let g:typescript_conceal_return               = "⇚"
" let g:typescript_conceal_prototype            = "¶"
" let g:typescript_conceal_super                = "Ω"


" Theme
syntax enable

set background=dark

let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_bold = 1 
colorscheme gruvbox-material
let g:airline_theme  = 'gruvbox_material'

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <leader>ut  :UndotreeToggle<cr>
nnoremap <leader>nt  :NERDTreeToggle<cr>
" refresh nerdtree file list
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>


nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Now make navigating between splits a little easier. Just use leader h,j,k,l
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader><Down> <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader><Up> <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader><Right> <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader><Left> <C-W><C-H>

" coc keybindings

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <leader>do <Plug>(coc-codeaction)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" end coc keybindings

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" make autoread trigger when changing buffer
au FocusGained,BufEnter * checktime

set shiftwidth=2
set tabstop=2
set smartindent
set expandtab
set foldmethod=syntax
set nofoldenable

" Numbers
set number
set numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" :BufOnly - closes all buffers apart from current one
command! BufOnly execute '%bdelete|edit #|normal `"'
