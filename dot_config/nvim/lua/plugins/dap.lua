local dap, dapui = require("dap"), require("dapui")

dapui.setup({})
require("nvim-dap-virtual-text").setup({})
require("mason-nvim-dap").setup({
  automatic_installation = true,
  handlers = {},
})

-- Open the UI when a session starts, close it when the program exits
dap.listeners.after.event_initialized.dapui_config = function() dapui.open({}) end
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

local function map(lhs, fn, desc, mode)
  vim.keymap.set(mode or "n", lhs, fn, { desc = desc })
end

map("<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, "DAP Breakpoint condition")
map("<leader>db", dap.toggle_breakpoint, "DAP Toggle breakpoint")
map("<leader>dc", dap.continue, "DAP Continue")
map("<leader>da", function() dap.continue({ before = function() return vim.split(vim.fn.input("Args: "), " ") end }) end, "DAP Run with args")
map("<leader>dC", dap.run_to_cursor, "DAP Run to cursor")
map("<leader>dg", dap.goto_, "DAP Go to line (no execute)")
map("<leader>di", dap.step_into, "DAP Step into")
map("<leader>dj", dap.down, "DAP Down")
map("<leader>dk", dap.up, "DAP Up")
map("<leader>dl", dap.run_last, "DAP Run last")
map("<leader>do", dap.step_out, "DAP Step out")
map("<leader>dO", dap.step_over, "DAP Step over")
map("<leader>dp", dap.pause, "DAP Pause")
map("<leader>dr", dap.repl.toggle, "DAP Toggle REPL")
map("<leader>dS", dap.session, "DAP Session")
map("<leader>dt", dap.terminate, "DAP Terminate")
map("<leader>dw", function() require("dap.ui.widgets").hover() end, "DAP Widgets")
map("<leader>dz", function() dap.eval() end, "DAP Eval")
map("<leader>dZ", function() dap.eval(vim.fn.input("Expression: ")) end, "DAP Eval expression")
map("<leader>df", "<cmd>FzfLua dap_breakpoints<cr>", "DAP List breakpoints")
map("<leader>du", function() dapui.toggle({}) end, "DAP UI")
map("<leader>de", function() dapui.eval() end, "DAP Eval", { "n", "v" })
