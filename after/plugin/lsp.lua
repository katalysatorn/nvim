local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
lspconfig.intelephense.setup({})

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
