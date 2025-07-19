return {
   {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      build = "make install_jsregexp",
      dependencies = {
         "saadparwaiz1/cmp_luasnip",
         "rafamadriz/friendly-snippets",
      },
   },
   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         -- buffer based completion options
         "hrsh7th/cmp-buffer",
         -- path based completion options
         "hrsh7th/cmp-path",
         -- lsp based completion options
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-cmdline",
         "hrsh7th/cmp-cmdline",
      },
      event = "InsertEnter",
      config = function()
         local cmp = require("cmp")
         require("luasnip.loaders.from_vscode").lazy_load()
         cmp.setup({
            snippet = {
               -- REQUIRED - you must specify a snippet engine
               expand = function(args)
                  require("luasnip").lsp_expand(args.body)
               end,
            },
            window = {
               --completion = cmp.config.window.bordered(),
               --documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
               -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
               -- ["<C-Space>"] = cmp.mapping.complete(),
               ["<C-e>"] = cmp.mapping.abort(),
               ["<Tab>"] = cmp.mapping.confirm({ select = true }),
               ["<C-j>"] = {
                  i = cmp.mapping.select_next_item({ behavior = require('cmp.types').cmp.SelectBehavior.Select }),
               },
               ["<C-k>"] = {
                  i = cmp.mapping.select_prev_item({ behavior = require('cmp.types').cmp.SelectBehavior.Select }),
               },
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "luasnip" },
               { name = "buffer" },
               { name = "path" },
               { name = "nvim_lua" },
            }),
         })
      end,
   },
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
         local cmp = require("cmp")
         local cmp_autopairs = require("nvim-autopairs.completion.cmp")
         require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt", "vim", "lazy", "mason", "dashboard", "neo-tree" },
         })
         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
   },
}
