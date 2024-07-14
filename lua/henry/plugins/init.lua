-- [[ Configure and install plugins ]]
require("lazy").setup({
	-- Todo commments, gitsigns, tab/space widths, etc.
	require("henry.plugins.ui"),

	-- Toggle term, undo tree
	require("henry.plugins.editor"),

	require("henry.plugins.treesitter"),

	require("henry.plugins.lsp"),

	require("henry.plugins.telescope"),

	require("henry.plugins.colorscheme"),

	require("henry.plugins.whichkey"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
