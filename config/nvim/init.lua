vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- vim.opt.clipboard = 'unnamed'

-- Clipboard related things causing major issues, like Neovim not starting up 
-- properly or long startup time.
-- Clipboard related things causing major issues, like Neovim not starting up 
-- properly or long startup time.
vim.opt.clipboard = {
  -- Trying to resolve issues using this. (Enable System-clipboard functionality.)
    name = "xsel",
    copy = {
        ["+"] = "xsel --nodetach -ib",
        ["*"] = "xsel --nodetach -ip"
    },
    paste = {
        ["+"] = "xsel -ob",
        ["*"] = "xsel -op"
    },
    cache_enabled = true,
}
vim.cmd([[set clipboard+=unnamedplus]])  -- Enable System-clipboard functionality. (This might be working well with the above thing.)


-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
