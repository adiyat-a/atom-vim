return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
    config = function ()
			vim.keymap.set(
				"n",
				"<leader>mt",
				"<cmd>RenderMarkdown toggle<CR>",
				{ desc = "[m]arkdown render [t]oggle" }
			)
      
    end
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install && git restore .",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.keymap.set(
				"n",
				"<leader>mb",
				"<cmd>MarkdownPreview<CR>",
				{ desc = "[m]arkdown preview [b]egin" }
			)
			vim.keymap.set(
				"n",
				"<leader>me",
				"<cmd>MarkdownPreviewStop<CR>",
				{ desc = "[m]arkdown preview [e]nd" }
			)
		end,
	},
}
