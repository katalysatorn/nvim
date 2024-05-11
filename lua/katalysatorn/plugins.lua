local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
 
require('lazy').setup({
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig' },
	{ 'VonHeikemen/lsp-zero.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'ms-jpq/coq_nvim' },
	{ 'ms-jpq/coq.artifacts' },
	{ 'ms-jpq/coq.thirdparty' },
	{
		'L3MON4D3/luasnip',
		build = 'make install_jsregexp'
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {
		},
		dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},
	{
		'utilyre/barbecue.nvim',
		name = 'barbecue',
		version = '*',
		dependencies = {
			'SmiteshP/nvim-navic',
			'nvim-tree/nvim-web-devicons',
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	}
})
