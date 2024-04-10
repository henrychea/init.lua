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
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      transparent = true,
    },
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
      transparent = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
  },
}
