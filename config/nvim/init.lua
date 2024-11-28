local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- LSP stuff
	use 'neovim/nvim-lspconfig' 
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- ZIG specific
	use 'ziglang/zig.vim'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'itchyny/calendar.vim'
	use 'christoomey/vim-tmux-navigator'
	use 'nvim-tree/nvim-tree.lua'
	use 'RaafatTurki/hex.nvim'

	use 'tpope/vim-dadbod'
	use 'kristijanhusak/vim-dadbod-ui'

	use 'kdheepak/lazygit.nvim'
	use 'nvim-treesitter/nvim-treesitter'

	use 'wakatime/vim-wakatime'

	use 'ldelossa/litee.nvim'
	use 'ldelossa/litee-calltree.nvim'
	
	-- Theme
	use {'dracula/vim', as = 'dracula'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Mapings and stuff
require('remap')

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

require('theme')
require('plugins')

-- TODO temp
require('litee.lib').setup({})
-- configure litee-calltree.nvim
require('litee.calltree').setup({})
