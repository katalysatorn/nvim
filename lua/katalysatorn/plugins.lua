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
        'sontungexpt/sttusline',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = { 'BufEnter' },
        config = function(_, opts)
            require('sttusline').setup {
                -- statusline_color = '#000000',
                statusline_color = 'StatusLine',

                -- | 1 | 2 | 3
                -- recommended: 3
                laststatus = 3,
                disabled = {
                    filetypes = {
                        -- 'NvimTree',
                        -- 'lazy',
                    },
                    buftypes = {
                        -- 'terminal',
                    },
                },
                components = {
                    'mode',
                    'filename',
                    'git-branch',
                    'git-diff',
                    '%=',
                    'diagnostics',
                    'lsps-formatters',
                    'copilot',
                    'indent',
                    'encoding',
                    'pos-cursor',
                    'pos-cursor-progress',
                },
            }
        end,
    },
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons'
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {

		}
	}
})
