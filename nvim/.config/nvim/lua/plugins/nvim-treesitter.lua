require'nvim-treesitter.configs'.setup
{
    context_commentstring =
    {
        enable = true,
        enable_autocmd = false,
    },
    highlight =
    {
        enable = true,
        disable = {},
    },
    indent =
    {
        enable = false,
        disable = {},
    },
    ensure_installed =
    {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "fish",
        "graphql",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "kotlin",
        "latex",
        "lua",
        "markdown",
        "python",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml"
    },
}
