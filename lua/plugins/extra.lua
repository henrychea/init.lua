-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local get_root_dir_node = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end
local get_root_dir_deno = function()
  local util = require("lspconfig.util")
  return util.root_pattern("deno.json", "deno.jsonc")
end

local luaLineOpts = {
  component_separators = "",
  section_separators = "",
}

return {
  -- Toggleterm
  "akinsho/toggleterm.nvim",
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  -- Undo history
  "mbbill/undotree",
  -- Git
  "tpope/vim-fugitive",
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = {
            preferences = {
              importModuleSpecifierPreference = "non-relative",
            },
          },
          single_file_support = false,
          root_dir = get_root_dir_node,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      component_separators = "",
      section_separators = "",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      theme = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
