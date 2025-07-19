return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {},
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
    vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)") -- comment line
    vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)") -- comment the selected code
  end,
}
