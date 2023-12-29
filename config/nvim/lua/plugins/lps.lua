vim.lsp.set_log_level("debug")

local servers = {
  clangd = {},
  zls = {},
  rust_server = {},
  pyright = {},
}

require("mason").setup()

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", bufopts)
	vim.keymap.set("n", "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)

	vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", bufopts)
end


local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = {
		--'tsserver',
		--'zls',
		--'rust_analyzer',
		--'pyright',
		--'clangd'
	},
})

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
