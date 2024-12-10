vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    -- vim.api.nvim_buf_del_keymap(0, 'n', '<C-l>')
    local _, _ = pcall(vim.api.nvim_buf_del_keymap, 0, 'n', '<C-l>')
  end,
})
