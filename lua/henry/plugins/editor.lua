return {
	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		opts = {},
		config = function()
			-- Toggleterm
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<CR>",
				{ noremap = true, silent = true, desc = "[T]oggle [F]loating Terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm size=10 direction=horizontal<CR>",
				{ noremap = true, silent = true, desc = "[T]oggle [H]orizontal Terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tv",
				"<cmd>ToggleTerm size=80 direction=vertical<CR>",
				{ noremap = true, silent = true, desc = "[T]oggle [V]ertical Terminal" }
			)

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				-- function to run on opening the terminal
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				-- function to run on closing the terminal
				on_close = function(term)
					vim.cmd("startinsert!")
				end,
			})

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.keymap.set(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Lazy[G]it" }
			)
		end,
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
