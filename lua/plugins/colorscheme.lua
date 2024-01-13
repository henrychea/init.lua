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
