return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = { "TelescopePrompt", "vim", "lazy", "mason", "dashboard", "neo-tree" },
      },
    })
  end,
}
