-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope the GOAT
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- File Browser for Telescope
    use { "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim" } }

    -- Tab browsing for Telescope
    use {
        'LukasPietzschmann/telescope-tabs',
        requires = { 'nvim-telescope/telescope.nvim' },
    }

    -- Project browsing for Telescope
    use {
        'nvim-telescope/telescope-project.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
    }

    -- Monokai Supreme
    use { "loctvl842/monokai-pro.nvim", requires = { 'MunifTanjim/nui.nvim' }
        , config = function()
            require("monokai-pro").setup({
                italic_comments = true,
                filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
                inc_search = "underline", -- underline | background
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                    whichkey = {
                        background_clear = true,
                    },
                    indent_blankline = {
                        context_highlight = "default" -- default | pro
                    },
                }
            })
            vim.keymap.set("n", "<leader>tt", "<cmd>MonokaiProSelect<CR>", { noremap = true, silent = true })
        end }

    -- Syntax
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- File pinning and navigation
    use('theprimeagen/harpoon')

    -- Undo history
    use('mbbill/undotree')

    -- Git
    use('tpope/vim-fugitive')
    use { "lewis6991/gitsigns.nvim",
        config = function()
            require "gitsigns".setup()
        end }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- LSP loading status indicator
    use { "j-hui/fidget.nvim",
        config = function()
            require "fidget".setup {}
        end }

    -- Formatting
    use { "jayp0521/mason-null-ls.nvim",
        requires = { "jose-elias-alvarez/null-ls.nvim" },
        after = "nvim-lspconfig",
    }

    -- Status Line
    use { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }

    -- Auto closing
    use { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end }

    -- Auto Tag Rename
    use { "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end }

    -- Auto Comment
    use { "JoosepAlviste/nvim-ts-context-commentstring", requires = { "numToStr/Comment.nvim" },
        config = function()
            require 'Comment'.setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end }

    -- Colorizer
    use { "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup {
                user_default_options = {
                    mode = "virtualtext",
                    tailwind = true, -- Enable tailwind colors
                },
            }
        end }

    -- Show line indents
    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "indent_blankline".setup({
                filetype_exclude = { "dashboard" },
                char = '┊',
                show_trailing_blankline_indent = false,
            })
        end }

    -- Bufferline
    use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = { "kyazdani42/nvim-web-devicons",
        config = function()
            require "nvim-web-devicons".setup {
                override = {},
                default = true
            }
        end } })

    -- Co-pilot
    use("github/copilot.vim")

    -- Epic Dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- Help me find that key!
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Toggle terminal
    use { "akinsho/toggleterm.nvim", tag = '*' }

    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'

end)
