call plug#begin("~/.vim/plugged")
  " Theme
  " Plug 'dracula/vim'
  Plug 'mhartington/oceanic-next'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'Townk/vim-autoclose'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

  " Syntax plugins
  Plug 'othree/html5.vim'
  Plug 'othree/yajs.vim'
  Plug 'HerringtonDarkholme/yats.vim'

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

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

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
" colorscheme dracula
colorscheme OceanicNext
let g:airline_theme='oceanicnext'


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:airline_powerline_fonts = 1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <leader>ut  :UndotreeToggle<cr>
nnoremap <leader>nt  :NERDTreeToggle<cr>

nnoremap <silent> K :call CocAction('doHover')<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
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

" map keys for scrolling utility windows from coc like func definitions
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

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
set number
