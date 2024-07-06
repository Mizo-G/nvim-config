return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		local M = {}
		require("nvim-surround").setup({
			surrounds = {
				["!"] = {
					add = { "{/* ", " */}" },
					find = "{/\\*.-\\*/}",
					delete = "^(\\{/\\* )().-( \\*/})$",
				},
			},
		})
	end,
}
