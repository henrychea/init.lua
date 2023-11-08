local present, lualine = pcall(require, "lualine")

if not present then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "lazy", "NvimTree", "dashboard", "alpha" },
        globalstatus = true,
    },
})
