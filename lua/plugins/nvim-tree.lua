return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		local tree = require("nvim-tree")
		tree.setup({
			sort = { sorter = "case_sensitive" },
			view = { width = 40, side = "left" },
			renderer = { group_empty = true },
			filters = { dotfiles = false },
		})

		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

		-- Автозапуск NvimTree у директорії файлу або поточній, якщо файлу немає
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		local api = require("nvim-tree.api")
		-- 		local file = vim.fn.expand("<afile>")  -- поточний файл
		-- 		local dir = vim.fn.expand("%:p:h")	 -- директорія файлу

		-- 		if vim.fn.isdirectory(file) == 1 then
		-- 			vim.cmd("cd " .. file)
		-- 			api.tree.open()
		-- 		elseif vim.fn.filereadable(file) == 1 then
		-- 			vim.cmd("cd " .. dir)
		-- 			api.tree.open()
		-- 		else
		-- 			api.tree.open()
		-- 		end
		-- 	end,
		-- })
	end,
}

