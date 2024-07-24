return {
	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		opts = function()
			return {
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { show_start = false, show_end = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
				},
			}
		end,
		main = "ibl",
	},
}
