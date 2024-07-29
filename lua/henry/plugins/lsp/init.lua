return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},
			-- make life easy with vtsls
			{
				"yioneko/nvim-vtsls",
				config = function()
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
					end
					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>cA", "<cmd>VtsExec source_actions<CR>", "Source [C]ode [A]ctions")
				end,
			},
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			-- Restart LSP Server
			vim.keymap.set(
				"n",
				"<leader>cL",
				":LspRestart<CR>",
				{ noremap = true, silent = true, desc = "LSP: [C]ode Restart [L]SP" }
			)

			local getIsFormatEnabledText = function(prefix, buf)
				if buf then
					local text = vim.b[buf].disable_autoformat and "Disabled" or "Enabled"
					return prefix .. " (" .. text .. ")"
				end
				local text = vim.g.disable_autoformat and "Disabled" or "Enabled"
				return prefix .. " (" .. text .. ")"
			end

			vim.keymap.set("n", "<leader>uF", function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				vim.print(getIsFormatEnabledText("Global Autoformat is:", nil))
			end, {
				noremap = true,
				silent = true,
				desc = getIsFormatEnabledText("UI Toggle Global [F]ormat", nil),
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("henry-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap.
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("<leader>uf", function()
						vim.b[event.buf].disable_autoformat = not vim.b[event.buf].disable_autoformat
						vim.print(getIsFormatEnabledText("Buffer Autoformat is:", event.buf))
					end, getIsFormatEnabledText("[U]I Disbale Buffer Autoformat", event.buf))

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup = vim.api.nvim_create_augroup("henry-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("henry-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "henry-lsp-highlight", buffer = event2.buf })
								if vim.g.disable_autoformat then
									vim.g.disable_autoformat = false
								end
							end,
						})
					end

					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>uh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[U]I Toggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				-- clangd = {},
				gopls = {},
				-- pyright = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							procMacro = {
								ignored = {
									leptos_macro = {
										-- optional: --
										-- "component",
										"server",
									},
								},
							},
							lens = {
								enable = true,
							},
						},
					},
				},
				eslint = {
					settings = { format = false },
				},
				vtsls = {
					-- explicitly add default filetypes, so that we can extend
					-- them in related extras
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						complete_function_calls = true,
						vtsls = {
							enableMoveToFileCodeAction = true,
							autoUseWorkspaceTsdk = true,
							experimental = {
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
						typescript = {
							updateImportsOnFileMove = { enabled = "always" },
							suggest = {
								completeFunctionCalls = true,
							},
							preferences = {
								importModuleSpecifier = { enabled = "relative" },
							},
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = false },
							},
						},
					},
				},
				denols = {
					root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
				},
				lua_ls = {
					settings = {
						format = false,
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				"biome",
				"eslint",
				"prettier",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
		end,
	},
	-- Formatting
	require("henry.plugins.lsp.conform"),
	-- Autocomplete
	require("henry.plugins.lsp.autocomplete"),
	-- Linting
	require("henry.plugins.lsp.linting"),
}
