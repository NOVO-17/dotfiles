return{
   "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', {})

    require("neo-tree").setup({
      filesystem = {
    filtered_items = {
      visible = true, -- True makes it visible(dimmed)
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
        close_if_last_window =true,
        enable_git_status = true,
    })
  end

}
