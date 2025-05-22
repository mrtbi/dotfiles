-- credits go to https://github.com/hendrikmi/dotfiles/blob/main/nvim/lua/core/keymaps.lua

-- keymaps for better default experience

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for conciseness
local opts = { noremap = true, silent = true }

-- disable the spacebar key's default behavior in normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<esc>', ':noh<cr>', opts)

-- save file
vim.keymap.set('n', '<c-s>', '<cmd> w <cr>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <cr>', opts)

-- quit file
vim.keymap.set('n', '<c-q>', '<cmd> q <cr>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- vertical scroll and center
vim.keymap.set('n', '<c-d>', '<c-d>zz', opts)
vim.keymap.set('n', '<c-u>', '<c-u>zz', opts)

-- find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'n', 'nzzzv')

-- resize with arrows
vim.keymap.set('n', '<up>', ':resize -2<cr>', opts)
vim.keymap.set('n', '<down>', ':resize +2<cr>', opts)
vim.keymap.set('n', '<left>', ':vertical resize -2<cr>', opts)
vim.keymap.set('n', '<right>', ':vertical resize +2<cr>', opts)

-- buffers
vim.keymap.set('n', '<tab>', ':bnext<cr>', opts)
vim.keymap.set('n', '<s-tab>', ':bprevious<cr>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<cr>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <cr>', opts) -- new buffer

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<c-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<c-x>', opts) -- decrement

-- window management
vim.keymap.set('n', '<leader>v', '<c-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<c-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<c-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<cr>', opts) -- close current split window

-- navigate between splits
vim.keymap.set('n', '<c-k>', ':wincmd k<cr>', opts)
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>', opts)
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>', opts)
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>', opts)

-- tabs
vim.keymap.set('n', '<leader>to', ':tabnew<cr>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<cr>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<cr>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<cr>', opts)     --  go to previous tab

-- toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<cr>', opts)

-- press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<esc>', opts)
vim.keymap.set('i', 'kj', '<esc>', opts)

-- stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- move text up and down
vim.keymap.set('v', '<a-j>', ':m .+1<cr>==', opts)
vim.keymap.set('v', '<a-k>', ':m .-2<cr>==', opts)

-- keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dp', opts)

-- replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>y', [["+y]])

-- toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostics list' })

-- save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<cr>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<cr>', { noremap = true, silent = false })
