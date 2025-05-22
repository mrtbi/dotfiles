require 'config.options'
require 'config.keymaps'

-- Install lazy package manager (from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Get color scheme
local nvim_theme = os.getenv 'NVIM_THEME' or 'catppuccin'

local themes = {
	catppuccin = 'plugins.themes.catppuccin',
}

require('lazy').setup {
	require(themes[nvim_theme]),
	require 'plugins.alpha',
	require 'plugins.autocompletion',
	require 'plugins.bufferline',
	require 'plugins.gitsigns',
	require 'plugins.indent-blankline',
	require 'plugins.kube-utils',
	require 'plugins.lsp',
	require 'plugins.lualine',
	require 'plugins.misc',
	require 'plugins.neo-tree',
	require 'plugins.none-ls',
	require 'plugins.telescope',
	require 'plugins.treesitter',
	require 'plugins.vim-tmux-navigator',
	require 'plugins.vimbegood',
	require 'plugins.whichkey',
}

-- Set color scheme
vim.cmd('colorscheme ' .. tostring(nvim_theme))

-- Load which-key mappings
require 'config.whichkey-custom'