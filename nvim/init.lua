-- Auto-install lazy.nvim (no manual git clone needed!)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic quality of life settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true  -- IMPORTANT for colors to work

vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set leader key (comma)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Configure plugins
require("lazy").setup({
  -- FILE TREE
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
        },
      })
      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
    end,
  },
  
  -- INDENT GUIDES
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
      })
    end,
  },
  
  -- CATPPUCCIN THEME
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
})

-- No background in vim
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[hi NormalNC guibg=NONE ctermbg=NONE]]

