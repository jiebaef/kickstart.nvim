vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

-- Decrease mapped sequence wait time; Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>qe', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

require 'custom.config.autocommands'

require 'custom.config.lazy'

-- [[ MY SETTINGS ]]
local helpers = require 'misc.helpers'

vim.opt.conceallevel = 1

vim.opt.cursorline = true
vim.opt.scrolloff = 999

vim.g.netrw_list_hide = table.concat(helpers.ignored_netrw_list, ',')

vim.keymap.set('n', '<leader>w', '<cmd>up<CR>', { desc = 'Updates (saves) file', noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>', { desc = 'Opens NETRW', noremap = true })
vim.keymap.set('n', '<leader><leader>x', '<cmd>source<CR>', { desc = 'Sources the current file', noremap = true })
vim.keymap.set('n', '<leader><leader>Gg', '<cmd>Git<CR>', { desc = 'Opens Git (vim-fugitive)', noremap = true })
vim.keymap.set('n', '<leader><leader>Gd', '<cmd>Gdiffsplit<CR>', { desc = 'Opens Git diff split of current window', noremap = true })
vim.keymap.set('n', '<leader>qa', vim.lsp.buf.code_action, { desc = 'Opens code action window to e.g. add missing imports', noremap = true, silent = true })

if helpers.isLinux() then
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
else
  vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

if helpers.isWindows() and not helpers.isWSL() then
  vim.o.shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell'
  vim.o.shellcmdflag =
    '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  -- vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  vim.o.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  vim.o.shellquote = ''
  vim.o.shellxquote = ''
end
-- [[ END MY SETTINGS ]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
