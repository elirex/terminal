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
        "lua",
        "python",
        "c",
        "cpp",
        "java"
    },
    autotag = {
        enable = true,
    },
}
