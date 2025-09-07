return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}


-- return {
--   {
--     "sainnhe/everforest",
--     lazy = false, -- завантажувати одразу
--     config = function()
--       vim.cmd([[colorscheme everforest]])
--       vim.opt.background = "dark"  -- або "light", якщо хочеш світлу версію
--     end,
--   }
-- }

-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     lazy = false, -- завантажувати одразу
--     config = function()
--       require("nightfox").setup({
--         options = {
--           -- варіанти: "dayfox", "dawnfox", "nightfox", "nordfox", "terafox", "carbonfox"
--           variant = "dawnfox",
--           dim_inactive = true,  -- затемнює неактивні буфери
--         }
--       })
--       vim.cmd([[colorscheme nightfox]])
--     end,
--   }
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }

