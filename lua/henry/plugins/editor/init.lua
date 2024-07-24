return {
	-- syntax
	require("henry.plugins.editor.treesitter"),
	-- neotree
	require("henry.plugins.editor.neotree"),
	-- bufferline
	require("henry.plugins.editor.bufferline"),
	-- telescope
	require("henry.plugins.editor.telescope"),
	-- whichkey help
	require("henry.plugins.editor.whichkey"),
	-- Toggleterm
	require("henry.plugins.editor.toggleterm"),
	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
		-- this is equalent to setup({}) function
	},
	-- Undo history
	{
		"mbbill/undotree",
		config = function()
			-- UndoTree
			vim.keymap.set(
				"n",
				"<leader>uu",
				"<cmd>UndotreeToggle<CR>",
				{ noremap = true, silent = true, desc = "Toggle [U]ndoTree" }
			)
		end,
	},
}
