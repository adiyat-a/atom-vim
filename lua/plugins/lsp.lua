-- TODO: extend capabilities of lsp
-- https://dev.to/elvessousa/taking-neovim-to-the-moon-274g
-- frankroeder/parrot.nvim | Exafunction/windsurf.nvim = for AI integration to Neovim
return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"shfmt",
					"java-test",
					"java-debug-adapter",
					"clang-format",
					"codelldb",
					"google-java-format",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = {
					exclude = {
						"jdtls",
					},
				},
				ensure_installed = {
					"lua_ls",
					"clangd",
					"jdtls",
					"marksman",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local base_on_attach = vim.lsp.config.clangd.on_attach
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("marksman", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.g.LAST_EXECUTED_FILE = ""
					vim.g.DELETE_LAST_EXECUTED_FILE = true
					vim.g.CPP_PROJECT = false
					client.server_capabilities.signatureHelpProvider = false
					vim.keymap.set(
						"n",
						"<leader>cld",
						"<cmd>lua vim.g.DELETE_LAST_EXECUTED_FILE = not vim.g.DELETE_LAST_EXECUTED_FILE; print(vim.g.DELETE_LAST_EXECUTED_FILE)<CR>",
						{ desc = "[cl]angd [d]elete last executed file toggle" }
					)
					vim.keymap.set(
						"n",
						"<leader>clp",
						"<cmd>lua vim.g.CPP_PROJECT = not vim.g.CPP_PROJECT; print(vim.g.CPP_PROJECT)<CR>",
						{ desc = "[cl]angd Cpp [p]roject toggle" }
					)
					base_on_attach(client, bufnr)
				end,
			})
			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "[l]sp [h]over definition" })
			vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[c]hange [n]ame of variable in code" })
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "[l]sp [d]efinition GOTO" })
			vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "[l]sp [r]estart" })
			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "[l]sp [i]nfo GOTO" })
			vim.keymap.set(
				"n",
				"<leader>cr",
				require("telescope.builtin").lsp_references,
				{ desc = "[c]ode [r]eferences" }
			)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ctions" })
		end,
	},
}
