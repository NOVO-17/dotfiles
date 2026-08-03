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
      automatic_installation = true,
      -- NOTE: use lsp-config names
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        -- "tsserver",   --this is not a lsp-config name
        "ts_ls",   
        "prismals",
        "emmet_ls",
        "pyright",
        "eslint",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- capabilities from cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        lua_ls = {},
        ts_ls = {}, -- prefer this name for lspconfig; 
        html = {},
        cssls = {},
        tailwindcss = {},
        prismals = {},
        emmet_ls = {},
        pyright = {},
        eslint = {},
      }

      local on_attach = function(_, bufnr)
        local buf_map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        buf_map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        buf_map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
        buf_map("n", "<leader>gr", vim.lsp.buf.references, "List references")
        buf_map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
      end

      for name, cfg in pairs(servers) do
        local merged = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, cfg or {})
        vim.lsp.config(name, merged)
        vim.lsp.enable(name)
      end
      -- vim.notify("LSP configs registered (vim.lsp.config) and enabled.", vim.log.levels.INFO)
    end,
  },
}
