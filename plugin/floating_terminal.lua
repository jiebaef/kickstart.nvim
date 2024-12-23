vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('n', '<leader><leader>t', '<cmd>Floaterminal<CR>', { desc = 'Opens a floating [t]erminal' })

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col_position = math.floor((vim.o.columns - width) / 2)
  local row_position = math.floor((vim.o.lines - height) / 2)

  local buffer = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buffer = opts.buf
  else
    buffer = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  local window_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col_position,
    row = row_position,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buffer, true, window_config)

  return { buf = buffer, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command('Floaterminal', toggle_terminal, {})
