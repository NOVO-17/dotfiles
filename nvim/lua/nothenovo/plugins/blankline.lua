return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			highlight = "IblIndent",
		},
		scope = {
			enabled = true,
			highlight = "IblScope",
		},
	},
	config = function(_,opts)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7" })
    require("ibl").setup(opts)
	end,
}
