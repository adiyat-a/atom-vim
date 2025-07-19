return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					initial_mode = "insert",
				},
				pickers = {
					find_files = {},
					live_grep = {},
					oldfiles = {},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							borderchars = {
								prompt = { "─", "│", "─", "│", "┌", "┐", "│", "│" },
								results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
								preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
							},
							--initial_mode = "normal",
						}),
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
			vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "[f]ind [t]ext" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[f]ind [r]ecent" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
			vim.keymap.set("n", "<leader>fm", builtin.help_tags, { desc = "[f]ind [m]anual" })
			vim.keymap.set("n", "<leader>fhf", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>", {
				desc = "[f]ind [h]idden [f]iles",
			})
			vim.keymap.set(
				"n",
				"<leader>fht",
				"<cmd>lua require('telescope.builtin').live_grep({vimgrep_arguments = {'rg','--color=never','--no-heading','--with-filename','--line-number','--column','--smart-case','--hidden',}})<CR>",
				{
					desc = "[f]ind [h]idden [t]ext",
				}
			)
		end,
	},
}
