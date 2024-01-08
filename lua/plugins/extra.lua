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

return {
  -- Toggleterm
  { "akinsho/toggleterm.nvim", event = "bufenter" },
  -- Undo history
  { "mbbill/undotree" },
  -- Git
  { "tpope/vim-fugitive" },
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
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "bufenter",
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        tailwind = true,
      },
    },
  },
}
