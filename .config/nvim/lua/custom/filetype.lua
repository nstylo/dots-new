local M = {}

M.sh = {
   shiftwidth = 4,
}

M.c = {
   shiftwidth = 4,
}

M.lua = {
   shiftwidth = 3,
}

for ft, settings in pairs(M) do
   for k, v in pairs(settings) do
      vim.cmd(string.format([[ autocmd FileType %s setlocal %s=%s ]], ft, k, v))
   end
end
