local o = vim.o
local g = vim.g

g.mapleader = " "
o.number = true
o.tabstop = 4
o.shiftwidth = 4
g.noswapfile = true
g.rainbow_active = 1

vim.opt.clipboard = 'unnamedplus'

require "telescope".setup { pickers = { buffers = { initial_mode = "normal" } } }

require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require('lspconfig')['rust_analyzer'].setup{}

vim.lsp.set_log_level("debug")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
keymap("n", "<leader>gf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope buffers<cr>", opts)

local keymap = vim.api.nvim_set_keymap
keymap("n", "<Left>", "<Nop>", {silent = true })
keymap("n", "<Right>", "<Nop>", {silent = true })
keymap("n", "<Up>", "<Nop>", {silent = true })
keymap("n", "<Down>", "<Nop>", {silent = true })

local on_attach = function(client, bufnr)
	
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	local k = vim.api.nvim_buf_set_keymap
	vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", bufopts)
	vim.keymap.set("n", "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)

	vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", bufopts)
end


local lsp_flags = {
  debounce_text_changes = 150,
}

require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}


local ok, _ = pcall(vim.cmd, 'colorscheme dracula')

return require('packer').startup(function()

	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig' 
	use {'dracula/vim', as = 'dracula'}
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'itchyny/calendar.vim'

end)
