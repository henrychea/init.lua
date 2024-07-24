return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- mini utilities
	require("henry.plugins.ui.mini"),
	-- dashboard
	require("henry.plugins.ui.dashboard"),
	-- colorschemes
	require("henry.plugins.ui.colorscheme"),
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	-- color code support
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
	-- toggle theme bg on the fly
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- Save and resetore nvim sessions
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},
	-- indent guidelines
	require("henry.plugins.ui.indentguideline"),
	-- noice
	require("henry.plugins.ui.noice"),
}
