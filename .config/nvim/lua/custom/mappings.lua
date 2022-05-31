local map = vim.keymap

-- Navigation
map.set("n", "<leader>cc", ":Telescope <CR>")
map.set("n", "<C-p>", ":Telescope find_files<CR>")
map.set("n", "<C-f>", ":Telescope live_grep<CR>")
map.set("n", "<leader>b", ":Telescope buffers<CR>")

-- Copy to clipboard
map.set("v", "Y", '"+y')

-- Resizing windows
map.set("", "<Up>", ":res +5<CR>")
map.set("", "<Down>", ":res -5<CR>")
map.set("", "<Right>", ":vertical res +5<CR>")
map.set("", "<Left>", ":vertical res -5<CR>")

-- Fugitive integration
map.set("n", "gl", ":Git blame<CR>")

-- Markdown preview
map.set("n", "<leader>m", ":MarkdownPreview<CR>")

map.set("n", "<C-_>", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
map.set("v", "<C-_>", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")

