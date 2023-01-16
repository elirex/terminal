local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "c",
        "cpp",
        "java",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "python",
        "typescript",
        "yaml"
    },
    autotag = {
        enable = true,
    },
}
