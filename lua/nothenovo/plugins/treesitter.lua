return{
  "nvim-treesitter/nvim-treesitter",
  branch = 'master', 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs") 
    config.setup({
      ensure_installed = { 
        "c",
        "cuda",
        "css",
        "csv",
        "go",
        "html",
        "lua",
        "javascript",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}


