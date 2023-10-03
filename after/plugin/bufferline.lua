local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    separator_style = '',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = false,
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<leader>b', '<cmd>tabedit<CR><cmd>Ex<CR>')
vim.keymap.set('n', '<leader>kb', '<cmd>BufferLineCloseOthers<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>')
