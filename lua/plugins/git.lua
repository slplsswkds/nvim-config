return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup {
			signs = {
				add					= { text = "┃" },
				change			 = { text = "┃" },
				delete			 = { text = "_" },
				topdelete		= { text = "‾" },
				changedelete = { text = "~" },
				untracked		= { text = "┆" },
			},
			current_line_blame = true, -- показувати blame біля рядка
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- 🔹 Навігація по змінах
				map("n", "]c", function()
					if vim.wo.diff then return "]c" end
					vim.schedule(function() gs.nav_hunk("next") end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then return "[c" end
					vim.schedule(function() gs.nav_hunk("prev") end)
					return "<Ignore>"
				end, { expr = true })

				-- 🔹 Дії з хунками
				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
				map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hR", gs.reset_buffer)

				-- 🔹 Diff / preview
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hi", gs.preview_hunk_inline)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function() gs.diffthis("~") end)

				-- 🔹 Blame
				map("n", "<leader>hb", function() gs.blame_line { full = true } end)

				-- 🔹 Toggles
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>tw", gs.toggle_word_diff)

				-- 🔹 Текстовий об'єкт (виділити hunk)
				map({ "o", "x" }, "ih", gs.select_hunk)
			end,
		}
	end,
}

