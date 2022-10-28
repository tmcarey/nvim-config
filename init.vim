set relativenumber
set completeopt-=preview
let $TERM="cygwin"
filetype plugin indent on

call plug#begin()
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Make sure you use single quotes
Plug 'vim-scripts/a.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'EdenEast/nightfox.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/typescript.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'mfussenegger/nvim-dap'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let mapleader = ","

autocmd!
" autocmd BufEnter * call system("nircmd win activate ititle \"cmd.exe\"")

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

colorscheme nightfox
let g:airline_themegruvbox='simple'

lua require("mason").setup()
lua require("mason-lspconfig").setup()

set completeopt=menu,menuone,noselect
lua require("lsp")

nmap <leader>v :edit $MYVIMRC<Enter>
nmap <leader>l :edit $MYVIMRC/../lua/lsp.lua<Enter>
nmap <leader>w :w <Enter>
nmap <leader>a :A <Enter>

nnoremap <leader>f <cmd>Telescope find_files<cr>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

