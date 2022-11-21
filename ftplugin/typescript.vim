set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
nnoremap <leader>q mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename "%"<CR>`F
