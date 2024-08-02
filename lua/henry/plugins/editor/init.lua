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
	-- Workspace diagnostics
	require("henry.plugins.editor.trouble"),
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
