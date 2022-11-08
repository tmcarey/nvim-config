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

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'EdenEast/nightfox.nvim'

Plug 'tpope/vim-surround'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

	local null_ls = require("null-ls")

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

				-- format on save
				vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
			end

			if client.server_capabilities.documentRangeFormattingProvider then
				vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
			end
		end,
	})

	local prettier = require("prettier")

	prettier.setup({
		bin = 'prettier', -- or `'prettierd'` (v0.22+)
		filetypes = {
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"yaml",
		},
	})

EOF

colorscheme nightfox
let g:airline_themegruvbox='simple'

lua require("mason").setup()
lua require("mason-lspconfig").setup()

set completeopt=menu,menuone,noselect
lua require("lsp")

nmap <leader>v :edit $MYVIMRC<Enter>
nmap <leader>w :w <Enter>
nmap <leader>a :A <Enter>
nmap <leader>t :NvimTreeToggle <Enter>

nnoremap <leader>f <cmd>Telescope find_files<cr>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

	-- empty setup using defaults
	require("nvim-tree").setup()

	-- OR setup with some options
	require("nvim-tree").setup({
	  sort_by = "case_sensitive",
	  view = {
		adaptive_size = true,
		mappings = {
		  list = {
			{ key = "u", action = "dir_up" },
		  },
		},
	  },
	  renderer = {
		group_empty = true,
	  },
	  filters = {
		dotfiles = true,
	  },
	})
EOF
