return {
   "ellisonleao/gruvbox.nvim",
   priority = 1000,
   opts = ...,
   config = function()
      require("gruvbox").setup({
         terminal_colors = true, -- add neovim terminal colors
         undercurl = true,
         underline = true,
         bold = true,
         italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
         },
         strikethrough = true,
         invert_selection = false,
         invert_signs = false,
         invert_tabline = false,
         invert_intend_guides = false,
         inverse = true, -- invert background for search, diffs, statuslines and errors
         contrast = "hard", -- can be "hard", "soft" or empty string
         palette_overrides = {},
         overrides = {
            DashboardHeader = { link = "GruvboxYellow" },
            DashboardFooter = { fg = "#8ec07c", italic = true },
            CursorLine = { bg = "#282828" },
            -- CursorColumn = { bg = "#282828" },
            CursorLineNr = { fg = "#b8bb26", bg = "#1d2021", bold = true }, -- b8bb26 3c3836
            LineNr = { fg = "#bdae93", bg = "#1d2021" },            -- bdae93 3c3836
            GruvboxRedSign = { bg = "#1d2021" },                    --  3c3836
            GruvboxGreenSign = { bg = "#1d2021" },                  --  3c3836
            GruvboxYellowSign = { bg = "#1d2021" },                 --  3c3836
            GruvboxBlueSign = { bg = "#1d2021" },                   --  3c3836
            GruvboxPurpleSign = { bg = "#1d2021" },                 --  3c3836
            GruvboxAquaSign = { bg = "#1d2021" },                   --  3c3836
            GruvboxOrangeSign = { bg = "#1d2021" },                 --  3c3836
            SignColumn = { bg = "#1d2021" },                        --  3c3836
            NormalFloat = { fg = "#ebdbb2", bg = "#1d2021" },
            DiagnosticVirtualTextError = { italic = true, fg = "#fb4934" },
            DiagnosticVirtualTextWarn = { italic = true, fg = "#fabd2f" },
            DiagnosticVirtualTextInfo = { italic = true, fg = "#83a598" },
            DiagnosticVirtualTextHint = { italic = true, fg = "#8ec07c" },
            TabLineFill = { fg = "#ebdbb2", bg = "#1d2021", bold = true },
            NonText = { fg = "#d5c4a1" },
            TelescopeBorder = { fg = "#7c6f64" },
            TelescopePromptBorder = { fg = "#7c6f64" },
            TelescopeResultsBorder = { fg = "#7c6f64" },
            TelescopePreviewBorder = { fg = "#7c6f64" },
            TelescopeSelectionCaret = { fg = "#b8bb26" },
            TelescopePromptPrefix = { link = "TelescopeSelectionCaret" },
            cssBorderOutlineProp = { fg = "#7c6f64" },
            LspSagaCodeActionBorder = { fg = "#7c6f64" },
            LspSagaLspFinderBorder = { fg = "#7c6f64" },
            LspSagaDefPreviewBorder = { fg = "#7c6f64" },
            LspSagaHoverBorder = { fg = "#7c6f64" },
            LspSagaRenameBorder = { fg = "#7c6f64" },
            LspSagaDiagnosticBorder = { fg = "#7c6f64" },
            LspSagaSignatureHelpBorder = { fg = "#7c6f64" },
            DapUIFloatBorder = { fg = "#7c6f64" },
            NotifyDEBUGBorder = { fg = "#7c6f64" },
            NotifyERRORBorder = { fg = "#7c6f64" },
            NotifyINFOBorder = { fg = "#7c6f64" },
            NotifyTRACEBorder = { fg = "#7c6f64" },
            NotifyWARNBorder = { fg = "#7c6f64" },
            MiniClueBorder = { fg = "#7c6f64" },
            MiniFilesBorder = { fg = "#7c6f64" },
            MiniNotifyBorder = { fg = "#7c6f64" },
            MiniPickBorder = { fg = "#7c6f64" },
            FloatBorder = { fg = "#7c6f64" },
         },
         dim_inactive = false,
         transparent_mode = false,
      })
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
   end,
}
