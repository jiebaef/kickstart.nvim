vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'fix move left in netrw file preview',
  pattern = 'netrw',
  callback = function()
    -- vim.api.nvim_buf_del_keymap(0, 'n', '<C-l>')
    local _, _ = pcall(vim.api.nvim_buf_del_keymap, 0, 'n', '<C-l>')
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  desc = '',
  pattern = '*',
  callback = function()
    local fugitive_type = vim.b.fugitive_type
    if fugitive_type then
      local label = {
        index = 'REMOTE (Index)',
        worktree = 'LOCAL (Working Copy)',
        blob = 'REMOTE (Blob)',
      }
      vim.opt_local.statusline = (label[fugitive_type] or fugitive_type) .. ' - %f'
    end
  end,
})
