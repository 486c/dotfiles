local o = vim.o
local g = vim.g
local opt = vim.opt
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Settings
g.mapleader = " "
o.number = true
o.tabstop = 4
o.shiftwidth = 4
g.noswapfile = true
o.swapfile = false
g.rainbow_active = 1
opt.colorcolumn = "75"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true
o.formatoptions = o.formatoptions .. 'cro'

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd(
	"BufEnter", 
	{ 
		callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end, 
	}
)

-- Remaps
keymap("n", "<leader>gf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope buffers<cr>", opts)

keymap("n", "<Left>", "<Nop>", {silent = true })
keymap("n", "<Right>", "<Nop>", {silent = true })
keymap("n", "<Up>", "<Nop>", {silent = true })
keymap("n", "<Down>", "<Nop>", {silent = true })
keymap("n", "<C-d>", "<C-d>zz", {silent = true})
keymap("n", "<C-u>", "<C-u>zz", {silent = true})
keymap("x", "<leader>p", "\"_dP", {silent = true})

keymap("n", "<leader>gx", "<cmd>HexToggle<cr>", opts)
keymap("n", "<leader>lg", "<cmd>LazyGit<cr>", opts)
keymap("n", "<leader>d", "<cmd>NvimTreeToggle<cr>", opts)


-- Terminal setup

vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
