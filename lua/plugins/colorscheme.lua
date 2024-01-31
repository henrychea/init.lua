return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
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
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      transparent_background = true,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    opts = {},
  },
  {
    "Tsuzat/NeoSolarized.nvim",
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = false,
      theme = "dragon",
    },
  },
}
