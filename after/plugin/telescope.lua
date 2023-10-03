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

vim.keymap.set('n', ';;', builtin.find_files, {})
vim.keymap.set('n', ';g', builtin.git_files, {})
vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';f',
    function()
        builtin.find_files({
            no_ignore = true,
            hidden = true
        })
    end)
vim.keymap.set('n', ';d', function()
    builtin.diagnostics()
end)
vim.keymap.set('n', '\\\\', function()
    builtin.buffers()
end)
vim.keymap.set('n', ';o', function()
    builtin.oldfiles()
end)
vim.keymap.set('n', '<leader>th', function()
    builtin.colorscheme()
end)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

vim.api.nvim_set_keymap(
    "n",
    "<leader>op",
    ":Telescope file_browser<CR>",
    { noremap = true }
)
