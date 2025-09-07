return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")  -- правильний require

		telescope.setup()
		telescope.setup{
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						width = 0.6,		  -- ширина вікна 80% екрану
						height = 0.5,		 -- висота вікна 60% екрану
						preview_width = 0.5,  -- ширина панелі прев’ю
					},
				},
				prompt_position = "top",
			}
		}


		-- Shift + : у нормальному режимі
		-- vim.keymap.set("n", ":", builtin.command_history, { noremap = true, silent = true })
		-- vim.keymap.set("n", ";:", function()
		-- 	require("telescope.builtin").command_history()
		-- end, { noremap = true, silent = true })
	end,
}

