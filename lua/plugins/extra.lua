-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- Toggleterm
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- Undo history
  { "mbbill/undotree" },
  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = { enabled = "relative" },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function()
          -- disable tsserver
          return true
        end,
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
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 2,
        priority = 100,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
}
