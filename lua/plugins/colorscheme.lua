return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1,
    lazy = false,
    opts = {
      transparent_background = true,
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
      transparent = true,
      theme = "dragon",
    },
  },
  { "projekt0n/github-nvim-theme" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
  },
}
