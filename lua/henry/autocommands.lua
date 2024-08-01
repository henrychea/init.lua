-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("henry-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	desc = "Prevent sh filetype for env files",
	group = vim.api.nvim_create_augroup("henry-env-file-cast", { clear = true }),
	pattern = { ".env", ".env.*" },
	command = "set filetype=env",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	desc = "Load Correct Source Actions",
	group = vim.api.nvim_create_augroup("henry-load-source-actions", { clear = true }),
	callback = function()
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
		end
		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		local clients = vim.lsp.get_clients()
		for _, client in pairs(clients) do
			if string.find(client.name, "vtsls") then
				map("<leader>cA", "<cmd>VtsExec source_actions<CR>", "Source [C]ode [A]ctions")
			end
		end
	end,
})
