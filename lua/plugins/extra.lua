return {
  -- Toggleterm
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- Undo history
  { "mbbill/undotree" },
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
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "andrew-george/telescope-themes",
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
        },
      },
    },
  },
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
}
