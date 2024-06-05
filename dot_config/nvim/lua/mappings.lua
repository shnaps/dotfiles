require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map('n', '<leader>i', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if found_float then
        return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("v", ">", ">gv", { desc = "Indent line" })

map("n", "<Up>", "<Nop>", { desc = "Disable Up arrow" })
map("n", "<Down>", "<Nop>", { desc = "Disable Down arrow" })
map("n", "<Left>", "<Nop>", { desc = "Disable Left arrow" })
map("n", "<Right>", "<Nop>", { desc = "Disable Right arrow" })

map("c", "<S-Enter>", function()
	require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline" })
map("n", "<leader>gl", function()
	require("noice").cmd("last")
end, { desc = "Noice Last Message" })
map("n", "<leader>gh", function()
	require("noice").cmd("history")
end, { desc = "Noice History" })
map("n", "<leader>ga", function()
	require("noice").cmd("all")
end, { desc = "Noice All" })
map("n", "<leader>gd", function()
	require("noice").cmd("dismiss")
end, { desc = "Dismiss All" })
