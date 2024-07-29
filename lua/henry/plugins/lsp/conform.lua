local tsjsFormatter = { { "biome", "prettier", "vtsls" } }
return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		dependencies = {
			{
				"zapling/mason-conform.nvim",
				opts = {},
				event = "BufEnter",
			},
		},
		event = "BufEnter",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				local disable_filetypes = { c = true, cpp = true, env = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters = {
				prettier = {
					require_cwd = true,
				},
				biome = {
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				dart = { "dart_format" },
				json = { { "biome", "prettier" } },
				javascript = tsjsFormatter,
				typescript = tsjsFormatter,
				javascriptreact = tsjsFormatter,
				typescriptreact = tsjsFormatter,
			},
		},
	},
}
