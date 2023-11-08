-- This file can be loaded by calling `lua require("plugins")` from your init.vim
require("lazy").setup({
	-- Toggleterm
	"akinsho/toggleterm.nvim",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Undo history
	"mbbill/undotree",
	-- Git
	"tpope/vim-fugitive",
	-- Syntax
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	}, -- File Browser for Telescope
	{ "nvim-telescope/telescope-file-browser.nvim", dependencies = {} },

	-- Monokai Pro
	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	config = function()
	-- 		require("monokai-pro").setup({
	-- 			italic_comments = true,
	-- 			filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
	-- 			inc_search = "underline", -- underline | background
	-- 			plugins = {
	-- 				bufferline = {
	-- 					underline_selected = false,
	-- 					underline_visible = false,
	-- 				},
	-- 				whichkey = { background_clear = true },
	-- 				indent_blankline = {
	-- 					context_highlight = "default", -- default | pro
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<leader>tt", "<cmd>MonokaiProSelect<CR>", { noremap = true, silent = true })
	-- 		vim.cmd([[colorscheme monokai-pro]])
	-- 	end,
	-- },
	-- Poimandres
	-- {
	-- 	"olivercederborg/poimandres.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("poimandres").setup({
	-- 			-- leave this setup function empty for default config
	-- 			-- or refer to the configuration section
	-- 			-- for configuration options
	-- 		})
	-- 	end,
	--
		-- optionally set the colorscheme within lazy config
		-- init = function()
		-- 	vim.cmd("colorscheme poimandres")
		-- end,
	-- },
	-- One dark
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "dark",
			})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme onedark")
		end,
	},
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			-- ...
	-- 		})
	--
	-- 		vim.cmd("colorscheme github_dark_high_contrast")
	-- 	end,
	-- },
	-- Git icons in sidebar
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"jayp0521/mason-null-ls.nvim",
			"onsails/lspkind.nvim", -- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua", -- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	-- LSP loading status indicator
	{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" }, -- Status Line
	-- Statusline
	{ "hoob3rt/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
	-- Auto closing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	-- Auto Tag Rename
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- Auto Comment
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = { "numToStr/Comment.nvim" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					mode = "virtualtext",
					tailwind = true, -- Enable tailwind colors
				},
			})
		end,
	},
	-- Show line indents
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Font icons
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ override = {}, default = true })
		end,
	},
	-- Bufferline
	{ "akinsho/bufferline.nvim", version = "*" }, -- Co-pilot
	-- Epic Dashboard
	{
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	-- Help me find that key!
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	-- Toggle wrapping modes
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup()
		end,
	},
	-- AI Complete
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
})
