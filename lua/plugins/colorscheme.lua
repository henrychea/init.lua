return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
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
}
