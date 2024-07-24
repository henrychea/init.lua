return {
	{
		"craftzdog/solarized-osaka.nvim",
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"Tsuzat/NeoSolarized.nvim",
	},
	{
		"loctvl842/monokai-pro.nvim",
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		opts = {
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
