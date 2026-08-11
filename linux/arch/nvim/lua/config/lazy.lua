-- Full statusline file path
require("lualine").setup({
	sections = {
		lualine_c = {
			{
				"filename",
				path = 3,
			},
		},
	},
})
