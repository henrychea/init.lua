local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end
local b = null_ls.builtins

null_ls.setup({
    sources = {
        -- Prettier formatter as daemon
        b.formatting.prettierd.with({
            condition = function(utils)
                return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.toml", ".prettierrc.yaml",
                    ".prettierrc.yml", ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs", ".prettierrc.json5",
                    ".prettierrc.jsonc", ".prettierrc.config.js", ".prettierrc.config.cjs", ".prettierrc.config.mjs",
                    "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs", ".prettierignore" })
            end,
        }),

        -- Eslint
        b.diagnostics.eslint_d.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
            condition = function(utils)
                return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.mjs",
                    ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", ".eslintrc.jsonc", ".eslintrc.toml",
                    ".eslintignore" })
            end,
        }),

        -- Ruby Rubocop
        b.formatting.rubocop,
        b.diagnostics.rubocop,

        -- Python black and pylint
        b.formatting.autopep8,
        b.diagnostics.pylint,

        -- Lua formatter
        b.formatting.stylua,

        -- Go
        b.formatting.gofumpt
    }
}
)
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})
