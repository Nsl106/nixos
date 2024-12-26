-- Rebind navigation keys
vim.api.nvim_set_keymap('n', 'h', 'h', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 't', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 's', 'l', { noremap = true })

vim.api.nvim_set_keymap('v', 'h', 'h', { noremap = true })
vim.api.nvim_set_keymap('v', 'n', 'j', { noremap = true })
vim.api.nvim_set_keymap('v', 't', 'k', { noremap = true })
vim.api.nvim_set_keymap('v', 's', 'l', { noremap = true })

vim.api.nvim_set_keymap('x', 'h', 'h', { noremap = true })
vim.api.nvim_set_keymap('x', 'n', 'j', { noremap = true })
vim.api.nvim_set_keymap('x', 't', 'k', { noremap = true })
vim.api.nvim_set_keymap('x', 's', 'l', { noremap = true })

-- Remap 'n' search functionality to '<Leader>n'
vim.api.nvim_set_keymap('n', 'l', 'n', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', 'N', { noremap = true })
