local map = vim.keymap

-- Navigation
map.set("n", "<C-p>", ":Telescope find_files<CR>")
map.set("n", "<C-f>", ":Telescope live_grep<CR>")
map.set("n", "<C-b>", ":Telescope buffers<CR>")
map.set("n", "<leader>z", ":Telescope zoxide list<CR>")

-- Resizing windows
map.set("", "<Up>", ":res +5<CR>")
map.set("", "<Down>", ":res -5<CR>")
map.set("", "<Right>", ":vertical res +5<CR>")
map.set("", "<Left>", ":vertical res -5<CR>")

-- Fugitive integration
map.set("n", "gl", ":Git blame<CR>")

-- Markdown preview
map.set("n", "<leader>m", ":MarkdownPreview<CR>")
