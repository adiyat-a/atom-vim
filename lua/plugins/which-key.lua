return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "show keymaps for current buffer",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			icons = {
				mappings = false,
				colors = false,
			},
		})
		wk.add({
			{ "<leader>f", group = "[f]ind" }, -- group
			{ "<leader>fh", group = "[f]ind [h]idden" }, -- group
			{ "<leader>cl", group = "[cl]angd" }, -- group
			{ "<leader>w", group = "[w]indow" }, -- group
			{ "<leader>c", group = "[c]ode" }, -- group
			{ "<leader>d", group = "[d]ebugger" }, -- group
			{ "<leader>dd", group = "[d]ebugger in [d]ebug" }, -- group
			{ "<leader>l", group = "[l]sp" }, -- group
			{ "<leader>h", group = "[h]arpoon" }, -- group
			{ "<leader>n", group = "[n]eovim" }, -- group
			{ "<leader>m", group = "[m]arkdown" }, -- group
			{ "<leader>w", group = "[w]indow" }, -- group
			{ "<leader>1", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>2", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>3", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>4", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>5", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>6", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>7", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>8", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>9", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>0", mode = { "n", "v", "i" }, hidden = true }, -- harpoon mappings
			{ "<leader>/", mode = { "n", "v", "i" }, hidden = true }, -- comment mappings
			{ "<leader>wh", mode = { "n", "v", "i" }, hidden = true }, -- window mappings
			{ "<leader>wj", mode = { "n", "v", "i" }, hidden = true }, -- window mappings
			{ "<leader>wk", mode = { "n", "v", "i" }, hidden = true }, -- window mappings
			{ "<leader>wl", mode = { "n", "v", "i" }, hidden = true }, -- window mappings
			{ "<C-w>", mode = { "n", "v", "i" }, hidden = true },
		})
	end,
}
