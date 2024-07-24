return {
	{
		"nvimdev/dashboard-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Restore Session",
							group = "Label",
							action = 'lua require("persistence").load()',
							key = "s",
						},
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{ desc = " Quit", group = "@property", action = "qa", key = "q" },
					},
				},
			})
		end,
	},
}
