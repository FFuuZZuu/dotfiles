"  ██ ████     ██ ██ ██████████    ██      ██ ██ ████     ████
" ░██░██░██   ░██░██░░░░░██░░░    ░██     ░██░██░██░██   ██░██
" ░██░██░░██  ░██░██    ░██       ░██     ░██░██░██░░██ ██ ░██
" ░██░██ ░░██ ░██░██    ░██       ░░██    ██ ░██░██ ░░███  ░██
" ░██░██  ░░██░██░██    ░██        ░░██  ██  ░██░██  ░░█   ░██
" ░██░██   ░░████░██    ░██     ██  ░░████   ░██░██   ░    ░██
" ░██░██    ░░███░██    ░██    ░██   ░░██    ░██░██        ░██
" ░░ ░░      ░░░ ░░     ░░     ░░     ░░     ░░ ░░         ░░
"

" {{{ Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'cespare/vim-toml'
Plug 'p00f/nvim-ts-rainbow'
Plug 'Dimercel/todo-vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'
Plug 'sainnhe/everforest'
Plug 'w0rp/ale'

call plug#end()

" }}}

" {{{ Settings

syntax enable

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set list
set number
set relativenumber
set foldmethod=marker
set listchars=tab:▸·,trail:·
set termguicolors

filetype plugin indent on

let g:everforest_background = 'medium'
colorscheme everforest

" plugin specific
lua require('gitsigns').setup()
let NERDTreeShowHidden = 1
let g:rustfmt_autosave = 1
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'
" use SumatraPDF if you are on Windows
let g:vimtex_view_method = 'zathura'

let g:ale_fixers = {
            \ 'javascript': ['eslint']
            \ }
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_fix_on_save = 1

lua <<EOF
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF

" }}}

" {{{ Keybinds

nnoremap <A-t> :NERDTreeToggle<CR>

nmap <F5> :TODOToggle<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" use alt+hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close buffer without messung with window layout
nnoremap <C-q> :Bdelete<CR>
" }}}
