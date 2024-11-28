require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "zig", "python", "sql", "go" },

	sync_install = true,

	auto_install = true,

	highlight = {
    	enable = true,
	},
}
