local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		tsserver = function()
			require("lspconfig").tsserver.setup({
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>to", "<cmd>OrganizeImports<cr>")
				end,
				single_file_support = false,
				root_dir = require("lspconfig.util").root_pattern("package.json"),
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "TS Organize Imports",
					},
				},
			})
		end,
		denols = function()
			require("lspconfig").denols.setup({
				root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
			})
		end,
		eslint = function()
			require("lspconfig").eslint.setup({
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>esa", "<cmd>EslintFixAll<cr>")
				end,
			})
		end,
	},
})

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "",
})

vim.diagnostic.config({
	virtual_text = true,
})

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()

require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		completion = {
			winhighlight = "normal:pmenu,floatborder:pmenu,search:none",
			col_offset = -3,
			side_padding = 0,
		},
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = cmp.mapping.preset.insert({
		-- confirm completion item
		["<cr>"] = cmp.mapping.confirm({ select = true }),

		-- toggle completion menu
		["<C-Space>"] = cmp_action.toggle_completion(),

		-- tab complete
		["<tab>"] = nil,
		["<s-tab>"] = nil,

		-- navigate between snippet placeholder
		["<c-d>"] = cmp_action.luasnip_jump_forward(),
		["<c-b>"] = cmp_action.luasnip_jump_backward(),

		-- scroll documentation window
		["<c-f>"] = cmp.mapping.scroll_docs(5),
		["<c-u>"] = cmp.mapping.scroll_docs(-5),

		--- old maps
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})
