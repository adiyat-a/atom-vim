return {
   "nvim-neo-tree/neo-tree.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- required by telescope, render-markdown
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
   },
   config = function()
      require("neo-tree").setup({
         follow_current_file = {
            enabled = true,        -- This will find and focus the file in the active buffer every time
            -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
         },
         use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
         -- instead of relying on nvim autocmd events.
         popup_border_style = "single",
         event_handlers = {
            {
               event = "file_open_requested",
               handler = function()
                  -- auto close
                  -- vim.cmd("Neotree close")
                  -- OR
                  require("neo-tree.command").execute({ action = "close" })
               end,
            },
            {
               event = "neo_tree_buffer_enter",
               handler = function()
                  vim.opt.showtabline = 0
               end,
            },
            {
               event = "neo_tree_buffer_leave",
               handler = function()
                  vim.opt.showtabline = 2
               end,
            },
         },
         window = {
            mappings = {
               ["<space>"] = {
                  "toggle_node",
                  nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
               },
               ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
            },
         },
      })
      vim.keymap.set("n", "<C-h>", "<cmd>Neotree filesystem toggle left<CR>")
      vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem toggle float<CR>")
   end,
}
