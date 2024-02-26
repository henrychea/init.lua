return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
