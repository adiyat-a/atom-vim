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
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
      })
      require("lspconfig").marksman.setup({
        capabilities = capabilities,
      })
      require("lspconfig").clangd.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
          require("plugins.configs.lspconfig").on_attach(client, bufnr)
        end,
        capabilities = capabilities,
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
