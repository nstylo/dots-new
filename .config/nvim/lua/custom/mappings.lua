local map = require("core.utils").map

-- Navigation
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")

-- Copy to clipboard
map("v", "Y", '"+y')

-- Resizing windows
map("", "<Up>", ":res +5<CR>")
map("", "<Down>", ":res -5<CR>")
map("", "<Right>", ":vertical res +5<CR>")
map("", "<Left>", ":vertical res -5<CR>")

-- Fugitive integration
map("n", "gb", ":Git blame<CR>")

-- Markdown preview
map("n", "<C-m>", ":MarkdownPreview<CR>")
