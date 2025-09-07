return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "black" },
			},
		}
	end,
}

