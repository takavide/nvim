local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float ({ border = "none" })
    end,
    --open_fn = require("packer.util").float,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Standard
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  use "lunarvim/colorschemes"
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use "rebelot/kanagawa.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig" -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim"

  -- Colorizer
  use "norcalli/nvim-colorizer.lua"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  --fix config treesitter config later
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Autopairs(treesitter and cmp together)
  use "windwp/nvim-autopairs"

  -- Comments
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring" -- helps know the context

  -- Gitsigns 
  use "lewis6991/gitsigns.nvim"

  -- Nvim-tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Blank indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  -- Impatient(loads faster)
  use "lewis6991/impatient.nvim"

  -- Whichkey
  use "folke/which-key.nvim"

  -- trouble.nvim
  use "folke/trouble.nvim"

  -- Dashboard
  use "glepnir/dashboard-nvim"

  -- Buffers stuff 
  use "ghillb/cybu.nvim"

  -- Discord activity(idk)
  --use "andweeb/presence.nvim"

  -- Buffers delete ez
  use 'famiu/bufdelete.nvim'

  -- DAP
  --use 'mfussenegger/nvim-dap'
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
