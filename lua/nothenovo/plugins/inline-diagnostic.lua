return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic", -- this matches your screenshot style
				transparent_bg = true,
				options = {
					show_source = true,
					use_icons_from_diagnostic = true,
					multilines = {
						enabled = true,
					},
        },
			})

			vim.diagnostic.config({
				virtual_text = false, -- disable default inline text
			})
		end,
	},
}
