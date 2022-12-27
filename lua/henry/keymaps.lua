-- Fast Quit and Save
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<cmd>w<CR><Esc>", { silent = true })

-- Select and move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without copy overwritten to clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- set copy to clip board with y and no system clipboard with Y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without cut to into clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- No macro record
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Keep centered
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Quick search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source Packer
vim.keymap.set("n", "<leader>uu", ":so ~/.config/nvim/lua/henry/packer.lua<CR>", { silent = true })

-- Sync Packer
vim.keymap.set("n", "<leader>us", ":PackerSync<CR>", { silent = false })
