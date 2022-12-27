local present, bufferline = pcall(require, "bufferline")

if not present then
    return
end

bufferline.setup({
    options = {
        color_icons = true,
        diagnostics = "nvim_lsp",
    },
})

vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext, { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev, { noremap = true, silent = true })
vim.keymap.set("n", "\\", vim.cmd.BufferLinePick, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", vim.cmd.bd, { noremap = true, silent = true })
