-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local get_root_dir_node = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  -- Toggleterm
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- Undo history
  { "mbbill/undotree" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "andrew-george/telescope-themes",
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
  },
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
        denols = {
          root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
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
        tailwind = "lsp",
        hsl_fn = true,
        names = false,
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
}
