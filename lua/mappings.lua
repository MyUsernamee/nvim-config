require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

map("n", "<Up>", ":echoe 'Get off my lawn!'<CR>")
map("n", "<Down>", ":echoe 'Get off my lawn!'<CR>")
map("n", "<Left>", ":echoe 'Get off my lawn!'<CR>")
map("n", "<Right>", ":echoe 'Get off my lawn!'<CR>")
map("i", "<Up>", "<C-o>:echoe 'Get off my lawn!'<CR>")
map("i", "<Down>", "<C-o>:echoe 'Get off my lawn!'<CR>")
map("i", "<Left>", "<C-o>:echoe 'Get off my lawn!'<CR>")
map("i", "<Right>", "<C-o>:echoe 'Get off my lawn!'<CR>")
map("v", "<Up>", ":<C-u>echoe 'Get off my lawn!'<CR>")
map("v", "<Down>", ":<C-u>echoe 'Get off my lawn!'<CR>")
map("v", "<Left>", ":<C-u>echoe 'Get off my lawn!'<CR>")
map("v", "<Right>", ":<C-u>echoe 'Get off my lawn!'<CR>")
