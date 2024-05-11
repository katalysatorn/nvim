local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
lspconfig.intelephense.setup({})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

vim.g.coq_settings = {
	auto_start = 'shut-up',
	keymap = {
		pre_select = true
	}
}
local coq = require('coq')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'clangd',
		'cmake',
		'gopls',
		'jsonls',
		'kotlin_language_server',
		'lua_ls',
		'markdown_oxide',
		'nil_ls',
		'pyright',
		'pylsp',
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup(coq.lsp_ensure_capabilities({}))
		end,
	},
})


lsp_zero.setup()
