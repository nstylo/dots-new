local map = require("core.utils").map

-- Navigation
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")

-- Copy to clipboard
map("v", "Y", '"+y')
