return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "lua", "bash", "json", "jsonc", "toml", "yaml", "markdown", "css", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
