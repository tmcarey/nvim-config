set relativenumber
set number
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

Plug 'zbirenbaum/copilot.lua'
" Plug 'zbirenbaum/copilot-cmp'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'onsails/lspkind.nvim'
Plug 'L3MON4D3/LuaSnip'

Plug 'windwp/nvim-ts-autotag'

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/typescript.nvim'

" Vim Script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'mfussenegger/nvim-dap'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let mapleader = ","

" autocmd BufEnter * call system("nircmd win activate ititle \"cmd.exe\"")
"
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

colorscheme tokyonight

lua require("mason").setup()
lua require("mason-lspconfig").setup()

set completeopt=menu,menuone,noselect
lua require("lsp")

nmap <leader>v :edit $MYVIMRC<Enter>
nmap <leader>w :w <Enter>
nmap <leader>a :A <Enter>
nmap <leader>t :NvimTreeToggle <Enter>

inoremap kj <Esc>
nnoremap <leader>f <cmd>Telescope find_files<cr>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)

autocmd FileType qf nmap <buffer> <cr> <cr>:cclose<cr>

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  -- examples for your init.lua

	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	-- OR setup with some options
	require("nvim-tree").setup({
	  sort_by = "case_sensitive",
	  view = {
			adaptive_size = true,
		mappings = {
		},
	  },
	  renderer = {
			group_empty = true,
	  },
	  filters = {
			dotfiles = false,
	  },
		actions = {
			open_file = {
				quit_on_open = true,
			}
		}
	})

	require('lualine').setup {
    options = {
      theme = 'tokyonight'
    }
  }


EOF

let g:lightline = {'colorscheme': 'tokyonight'}
