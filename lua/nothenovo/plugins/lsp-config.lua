return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_enable = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        lua_ls = {},
        ts_ls= {},
        html = {},
        pyright = {},
      }

      for name, config in pairs(servers) do
        vim.lsp.start(vim.lsp.config({
          name = name,
          cmd = require("lspconfig")[name].document_config.default_config.cmd,
          root_dir = require("lspconfig.util").root_pattern(
            ".git",
            "package.json",
            "pyproject.toml",
            "setup.py",
            "Makefile"
          ),
          capabilities = capabilities,
          settings = config.settings,
        }))
      end

      local map = vim.keymap.set
      map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      map("n", "<leader>gr", vim.lsp.buf.references, { desc = "List references" })
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    end,
  },
}

