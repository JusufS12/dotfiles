vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.relativenumber = true

vim.keymap.set('n', '<leader>e', '<Cmd>Explore<CR>', {})
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>', {})
vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', {})
