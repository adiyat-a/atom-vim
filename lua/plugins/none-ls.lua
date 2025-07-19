return {
	"nvimtools/none-ls.nvim",
	config = function()
		local none_ls = require("null-ls")
		local clang_format = none_ls.builtins.formatting.clang_format
		clang_format.disabled_filetypes = { "java" }
		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.shfmt,
        clang_format,
				none_ls.builtins.formatting.google_java_format,
				none_ls.builtins.formatting.prettier,
			},
		})
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[c]ode [f]ormat" })
	end,
}
