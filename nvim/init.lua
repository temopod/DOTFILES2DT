-- ==========================================================================
-- 1. BOOTSTRAP LAZY.NVIM (Package Manager)
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================================================
-- 2. BASIC SETTINGS
-- ==========================================================================
vim.g.mapleader = " " -- Set Space as the leader key
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.termguicolors = true -- Enable true color support

-- ==========================================================================
-- 3. PLUGIN SETUP (Fulfilling assignment requirements)
-- ==========================================================================
require("lazy").setup({
  -- Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() vim.cmd([[colorscheme tokyonight]]) end },

  -- File Explorer with Icons (neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    keys = { { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" } },
  },

  -- Fuzzy Finder (Telescope)
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = { 
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" }
    }
  },

  -- Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "python" },
        highlight = { enable = true },
      }
    end
  },

  -- Status Line (lualine)
  { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = { theme = 'tokyonight' } },

  -- LSP Support (Language Server Protocol)
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } }) end },
  { "neovim/nvim-lspconfig", config = function() require("lspconfig").lua_ls.setup({}) end },
})