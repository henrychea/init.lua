-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.g.mapleader = " "

vim.keymap.set("n", "ge", "$")
vim.keymap.set("n", "gf", "0")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-q>", "<cmd>q<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<CR>")

-- UndoTree
vim.keymap.set(
  "n",
  "<leader>uu",
  "<cmd>UndotreeToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle UndoTree" }
)

-- Fork (Git UI MacOS)
vim.keymap.set("n", "<leader>gu", function()
  Util.terminal({ "fork" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Fork (root dir)" })

-- Toggleterm
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.keymap.set(
  "n",
  "<leader>tf",
  "<cmd>ToggleTerm direction=float<CR>",
  { noremap = true, silent = true, desc = "Toggle Floating Terminal" }
)
vim.keymap.set(
  "n",
  "<leader>th",
  "<cmd>ToggleTerm size=10 direction=horizontal<CR>",
  { noremap = true, silent = true, desc = "Toggle Horizontal Terminal" }
)
vim.keymap.set(
  "n",
  "<leader>tv",
  "<cmd>ToggleTerm size=80 direction=vertical<CR>",
  { noremap = true, silent = true, desc = "Toggle Vertical Terminal" }
)
vim.keymap.set("n", "<leader>xC", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

vim.keymap.set("n", "<leader>cL", ":LspRestart<CR>", { noremap = true, silent = true, desc = "Restart LSP" })
