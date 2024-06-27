return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "biome",
        "rust-analyzer",
        "vtsls",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
    },
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 2, {
        name = "codeium",
        group_index = 2,
        priority = 100,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        dartls = {},
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
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = {
                ignored = {
                  leptos_macro = {
                    -- optional: --
                    -- "component",
                    "server",
                  },
                },
              },
              lens = {
                enable = true,
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
}
