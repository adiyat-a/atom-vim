return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")

			local colors = {
				bg1 = "#1d2021",
				bg2 = "#282828",
				bg3 = "#3c3836",
				bg4 = "#504945",
				fg = "#fbf1c7",
				-- dark_fg = "#bdae93",
				dark_fg = "#928374",
				yellow = "#fabd2f",
				dark_yellow = "#d79921",
				blue = "#83a598",
				dark_blue = "#458588",
				aqua = "#8ec07c",
				dark_aqua = "#689d6a",
				orange = "#fe8019",
				dark_orange = "#d65d0e",
				purple = "#d3869b",
				dark_purple = "#b16286",
				green = "#b8bb26",
				dark_green = "#98971a",
				red = "#fb4934",
				dark_red = "#cc241d",
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			-- Config
			local config = {
				options = {
					-- Disable sections and component separators
					-- component_separators = "",
					-- section_separators = "",
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					component_separators = { left = "\\", right = "/" },
					section_separators = { left = "", right = "" },
					-- theme = "gruvbox-material",
					theme = {
						-- We are going to use lualine_c an lualine_x as left and
						-- right section. Both are highlighted by c theme .  So we
						-- are just setting default looks o statusline
						normal = {
							a = { fg = colors.dark_fg, bg = colors.bg4 },
							b = { fg = colors.dark_fg, bg = colors.bg3 },
							c = { fg = colors.dark_fg, bg = colors.bg2 },
						},
						inactive = {
							a = { fg = colors.dark_fg, bg = colors.bg3 },
							b = { fg = colors.dark_fg, bg = colors.bg2 },
							c = { fg = colors.dark_fg, bg = colors.bg1 },
						},
					},
					disabled_filetypes = { "TelescopePrompt", "vim", "lazy", "mason", "dashboard", "neo-tree" },
				},
				sections = {
					lualine_a = {
						{
							-- mode component
							function()
								return " 󰹻 "
							end,
							color = function()
								-- auto change color according to neovims mode
								local mode_color = {
									n = colors.green,
									i = colors.red,
									v = colors.red,
									[""] = colors.red,
									V = colors.red,
									c = colors.red,
									no = colors.red,
									s = colors.orange,
									S = colors.orange,
									[""] = colors.orange,
									ic = colors.yellow,
									R = colors.purple,
									Rv = colors.purple,
									cv = colors.red,
									ce = colors.red,
									r = colors.green,
									rm = colors.green,
									["r?"] = colors.green,
									["!"] = colors.red,
									t = colors.red,
								}
								return { fg = colors.bg3, bg = mode_color[vim.fn.mode()] }
							end,
							padding = 0,
						},
					},
					lualine_b = {
						{
							"filename",
							cond = conditions.buffer_not_empty,
							color = { fg = colors.fg, gui = "bold" },
						},
						{ "progress", color = { fg = colors.fg } },
						{
							"location",
							color = { fg = colors.fg },
						},
						{
							"branch",
							icons_enabled = false,
							icon = "",
							color = { fg = colors.purple, gui = "bold" },
							component_separators = "",
							cond = nil,
						},
						{
							"diff",
							-- Is it me or the symbol for modified us really weird
							-- symbols = { added = " ", modified = " ", removed = " " },
							symbols = { added = "", modified = "", removed = "" },
							diff_color = {
								added = { fg = colors.aqua },
								modified = { fg = colors.orange },
								removed = { fg = colors.red },
							},
							cond = nil,
						},
					},
					lualine_c = {
						{
							"harpoon2",
							icons_enabled = false,
							icon = { "", color = { fg = colors.green } },
							indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" },
							active_indicators = {
								"[1]",
								"[2]",
								"[3]",
								"[4]",
								"[5]",
								"[6]",
								"[7]",
								"[8]",
								"[9]",
								"[10]",
							},
							color = { fg = colors.dark_fg },
							color_active = { fg = colors.green },
							_separator = " ",
							no_harpoon = "Harpoon not loaded",
						},
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic", "coc" },
							sections = { "error", "warn", "info", "hint" },
							-- symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
							symbols = { error = "", warn = "", info = "", hint = "" },
							diagnostics_color = {
								error = { fg = colors.red },
								warn = { fg = colors.yellow },
								info = { fg = colors.blue },
								hint = { fg = colors.aqua },
							},
							colored = true,
						},
					},
					lualine_y = {
						{
							-- filesize component
							"filesize",
							cond = conditions.buffer_not_empty,
							color = { fg = colors.fg },
						},
						-- {
						-- 	"o:encoding", -- option component same as &encoding in viml
						-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
						-- 	cond = conditions.hide_in_width,
						-- 	color = { fg = colors.fg },
						-- },
						-- {
						-- 	"fileformat",
						-- 	fmt = string.upper,
						-- 	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
						-- 	color = { fg = colors.fg },
						-- },
					},
					lualine_z = {
						{
							"lsp_status",
							icons_enabled = false,
							icon = { "", color = { fg = colors.blue } },
							symbols = {
								-- Standard unicode symbols to cycle through for LSP progress:
								spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
								-- Standard unicode symbol for when LSP is done:
								done = "󰄴",
								-- Delimiter inserted between LSP names:
								separator = " ",
							},
							-- List of LSP names to ignore (e.g., `null-ls`):
							ignore_lsp = { "null-ls" },
							color = { fg = colors.blue, gui = "bold" },
						},
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {
						{
							"filename",
							cond = conditions.buffer_not_empty,
							color = { fg = colors.dark_fg, gui = "bold" },
						},
						{ "progress", color = { fg = colors.dark_fg } },
						{
							"location",
							color = { fg = colors.dark_fg },
						},
						{
							"branch",
							icons_enabled = false,
							icon = "",
							color = { fg = colors.dark_purple, gui = "bold" },
							component_separators = "",
							cond = nil,
						},
						{
							"diff",
							-- Is it me or the symbol for modified us really weird
							-- symbols = { added = " ", modified = " ", removed = " " },
							symbols = { added = "", modified = "", removed = "" },
							diff_color = {
								added = { fg = colors.dakr_aqua },
								modified = { fg = colors.dark_orange },
								removed = { fg = colors.dark_red },
							},
							cond = nil,
						},
					},
					lualine_c = {
						{
							"harpoon2",
							icons_enabled = false,
							icon = { "", color = { fg = colors.dark_green } },
							indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" },
							active_indicators = {
								"[1]",
								"[2]",
								"[3]",
								"[4]",
								"[5]",
								"[6]",
								"[7]",
								"[8]",
								"[9]",
								"[10]",
							},
							color = { fg = colors.dark_fg },
							color_active = { fg = colors.dark_green },
							_separator = " ",
							no_harpoon = "Harpoon not loaded",
						},
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic", "coc" },
							sections = { "error", "warn", "info", "hint" },
							-- symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
							symbols = { error = "", warn = "", info = "", hint = "" },
							diagnostics_color = {
								error = { fg = colors.dark_red },
								warn = { fg = colors.dark_yellow },
								info = { fg = colors.dark_blue },
								hint = { fg = colors.dark_aqua },
							},
							colored = true,
						},
					},
					lualine_y = {
						{
							-- filesize component
							"filesize",
							cond = conditions.buffer_not_empty,
							color = { fg = colors.dark_fg },
						},
						-- {
						-- 	"o:encoding", -- option component same as &encoding in viml
						-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
						-- 	cond = conditions.hide_in_width,
						-- 	color = { fg = colors.dark_fg },
						-- },
						-- {
						-- 	"fileformat",
						-- 	fmt = string.upper,
						-- 	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
						-- 	color = { fg = colors.dark_fg },
						-- },
					},
					lualine_z = {},
				},
			}
			TabLine = function()
				return table.concat({
					vim.api.nvim_buf_get_name(0),
				})
			end

			vim.opt.tabline = "%!v:lua.TabLine()"

			-- Now don't forget to initialize lualine
			lualine.setup(config)
		end,
	},
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},
}
