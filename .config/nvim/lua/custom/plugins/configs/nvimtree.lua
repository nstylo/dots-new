local M = {}

M.view = {
   mappings = {
      list = {
         { key = {"<2-RightMouse>", "<C-]>", "+"},    action = "cd" },
      }
   },
   width = 40,
   adaptive_size = true
}

return M
