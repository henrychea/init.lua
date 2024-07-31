local function copy_path(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	vim.ui.select({
		"1. Absolute path: " .. results[1],
		"2. Path relative to CWD: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}, { prompt = "Choose to copy to clipboard:" }, function(choice)
		if choice then
			local i = tonumber(choice:sub(1, 1))
			if i then
				local result = results[i]
				vim.fn.setreg("+", result)
				vim.fn.setreg('"', result)
				vim.notify("Copied: " .. result)
			else
				vim.notify("Invalid selection")
			end
		else
			vim.notify("Selection cancelled")
		end
	end)
end

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- neotree window picker
			{
				"s1n7ax/nvim-window-picker",
				name = "window-picker",
				event = "VeryLazy",
				version = "2.*",
				opts = {},
			},
		},
		cmd = "Neotree",
		keys = {
			{ "\\", ":Neotree toggle<CR>", { desc = "NeoTree toggle" } },
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				window = {
					mappings = {
						["\\"] = "close_window",
						["Y"] = copy_path,
					},
				},
			},
		},
	},
}
