local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
  local use = use
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' 
  use {'dracula/vim', as = 'dracula'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use "williamboman/mason.nvim"
  use 'itchyny/calendar.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-tree/nvim-tree.lua'
  end
)

require("mason").setup()

local o = vim.o
local g = vim.g
local opt = vim.opt

g.mapleader = " "
o.number = true
o.tabstop = 4
o.shiftwidth = 4
g.noswapfile = true
g.rainbow_active = 1
opt.colorcolumn = "75"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
	icons = {
	   show = {
		file = false,
		folder = false,
		folder_arrow = false,
		git = false,
	   }
	},
    group_empty = true,
  },
})

vim.api.nvim_create_autocmd(
	"BufEnter", 
	{ 
		callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end, 
	}
)
o.formatoptions = o.formatoptions .. 'cro'

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

-- Remaps
local keymap = vim.api.nvim_set_keymap
keymap("n", "<Left>", "<Nop>", {silent = true })
keymap("n", "<Right>", "<Nop>", {silent = true })
keymap("n", "<Up>", "<Nop>", {silent = true })
keymap("n", "<Down>", "<Nop>", {silent = true })
keymap("n", "<C-d>", "<C-d>zz", {silent = true})
keymap("n", "<C-u>", "<C-u>zz", {silent = true})
keymap("x", "<leader>p", "\"_dP", {silent = true})

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

require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}


local ok, _ = pcall(vim.cmd, 'colorscheme dracula')

return require('packer').startup(function()
end)

