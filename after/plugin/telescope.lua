local present, telescope = pcall(require, "telescope")

if not present then
    return
end

local actions = require("telescope.actions")
local builtin = require('telescope.builtin')
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".DS_Store" },
        mappings = {
            n = {
                ["q"] = actions.close,
                ["<C-k>"] = actions.select_tab,
            },
            i = {
                ["<C-q>"] = actions.close,
                ["<C-k>"] = actions.select_tab,
            },
        },
        color_devicons = true,
        prompt_prefix = '🔍 ',
        scroll_strategy = 'cycle',
        sorting_strategy = 'ascending',
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            -- mappings = {
            --     -- your custom insert mode mappings
            --     ["i"] = {
            --         ["<C-w>"] = function()
            --             vim.cmd("normal vbd")
            --         end,
            --     },
            --     ["n"] = {
            --         -- your custom normal mode mappings
            --         ["N"] = fb_actions.create,
            --         ["h"] = fb_actions.goto_parent_dir,
            --         ["/"] = function()
            --             vim.cmd("startinsert")
            --         end,
            --     },
            -- },
        },
    },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    ":Telescope file_browser<CR>",
    { noremap = true }
)

require 'telescope'.load_extension('project')

vim.api.nvim_set_keymap(
    "n",
    "<leader>fp",
    ":lua require('telescope').extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

require 'telescope-tabs'.setup {
    vim.api.nvim_set_keymap(
        "n",
        "<leader>ft",
        ":Telescope telescope-tabs list_tabs<CR>",
        { noremap = true }
    )
}
