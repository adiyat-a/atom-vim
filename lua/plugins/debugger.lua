return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-jdtls",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		--   dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		--   dapui.close()
		-- end
		dap.configurations.java = {
			{
				javaExec = "java",
				request = "launch",
				type = "java",
			},
		}
		dapui.setup({
      expand_lines = false,
			-- layouts = {
			-- 	{
			-- 		elements = {
			-- 			{
			-- 				id = "console",
			-- 				size = 1,
			-- 			},
			-- 		},
			-- 		position = "center",
			-- 		size = 40,
			-- 	},
			-- },
		})
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[d]ebugger toggle [b]reakpoint" })
		vim.keymap.set("n", "<leader>dl", dap.continue, { desc = "[d]ebugger [l]aunch" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "[d]ebugger [t]oggle UI GOTO" })
	end,
}
