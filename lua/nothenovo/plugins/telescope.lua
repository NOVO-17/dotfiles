return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "andrew-george/telescope-themes",
            "BurntSushi/ripgrep",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            require("telescope").setup({

                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                        },
                    },
                },

                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown{},
                    },
                    themes = {
                        enable_previewer = true,
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                        },
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("themes")
            vim.keymap.set("n", "<leader><space>", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>pWs", function() local word = vim.fn.expand("<cWORD>") builtin.grep_string({ search = word }) end, { desc = "Find Connected Words under cursor" })
            vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
        end,
    },
}
