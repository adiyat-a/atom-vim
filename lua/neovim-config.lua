-- whichkey mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<nop>", { silent = true, remap = true })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "split [w]indow [v]ertically" })
vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "[s]plit [w]indow horizontally" })
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "I", "<cmd> lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})<CR>")
vim.keymap.set("n", "O", "<cmd> lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})<CR>")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>w+", "<C-w>+", { desc = "[+] focused [w]indow" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { desc = "[-] focused [w]indow" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "align [=]" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { desc = "[-] focused [w]indow" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { desc = "[+] focused [w]indow" })
vim.keymap.set("n", "<leader>nl", "<cmd>Lazy<CR>", { desc = "[n]eovim [l]azy menu" })
vim.keymap.set("n", "<leader>nm", "<cmd>Mason<CR>", { desc = "[n]eovim [m]ason menu" })
vim.keymap.set("n", "<leader>nc", "<cmd>checkhealth<CR>", { desc = "[n]eovim [c]heckhealth" })
vim.keymap.set("n", "<leader>nn", "<cmd>messages<CR>", { desc = "[n]eovim [n]otification messages" })

-- setting neovim
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set numberwidth=1")
vim.cmd("set signcolumn=yes")
vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])

-- cd aliases
vim.keymap.set("ca", "pd", "cd -")

-- remaking keymappings
vim.keymap.set({ "n", "v" }, "J", "6j", {})
vim.keymap.set({ "n", "v" }, "K", "6k", {})

-- removing keymappings
vim.cmd("noremap <C-/> <nop>")
vim.cmd("noremap <C-_> <nop>")
vim.cmd("noremap <C-w>s <nop>")
vim.cmd("noremap <C-w>v <nop>")
vim.cmd("noremap <C-w>h <nop>")
vim.cmd("noremap <C-w>j <nop>")
vim.cmd("noremap <C-w>k <nop>")
vim.cmd("noremap <C-w>l <nop>")
vim.cmd("noremap <C-w>+ <nop>")
vim.cmd("noremap <C-w>- <nop>")
vim.cmd("noremap <C-w>= <nop>")
vim.cmd("noremap <C-w>> <nop>")
vim.cmd("noremap <C-w>< <nop>")
vim.cmd("noremap! <C-w>s <nop>")
vim.cmd("noremap! <C-w>v <nop>")
vim.cmd("noremap! <C-w>h <nop>")
vim.cmd("noremap! <C-w>j <nop>")
vim.cmd("noremap! <C-w>k <nop>")
vim.cmd("noremap! <C-w>l <nop>")
vim.cmd("noremap! <C-w>+ <nop>")
vim.cmd("noremap! <C-w>- <nop>")
vim.cmd("noremap! <C-w>= <nop>")
vim.cmd("noremap! <C-w>> <nop>")
vim.cmd("noremap! <C-w>< <nop>")

-- making a shortcut to copy selection into main clipboard buffer
vim.cmd('vnoremap <C-y> "+y')

-- disabling arrow keys for visual mode
vim.cmd("noremap <Up> <nop>")
vim.cmd("noremap <Down> <nop>")
vim.cmd("noremap <Left> <nop>")
vim.cmd("noremap <Right> <nop>")

--vim.cmd("autocmd CmdlineLeave : echo ''") -- to clear cmdline after command is executed

-- disable the highlighting of search
vim.cmd("nnoremap <Esc> :nohlsearch<CR>")

-- WARN:
-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- Virtual text
vim.diagnostic.config({ virtual_text = true })

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- tabline
vim.opt.showtabline = 2

-- global variables

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scroll
vim.opt.so = 30

-- Shorter messages
vim.opt.shortmess:append("c")

-- disable ~ at the end of empty line
vim.opt.fillchars = {
	vert = "│",
	fold = "-",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.opt.swapfile = false -- disable swapfile
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.fileformat = "unix"
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true
vim.wo.relativenumber = true

-- disabling vulnerabilities
vim.cmd("set modelines=0")

-- temp
--vim.lsp.set_log_level("debug")
