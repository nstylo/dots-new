local M = {}

M.sh = {
  shiftwidth = 4,
}

M.c = {
  shiftwidth = 4,
}

for ft, settings in pairs(M) do
  for k, v in pairs(settings) do
    vim.cmd(string.format([[ autocmd FileType %s setlocal %s=%s ]], ft, k, v))
  end
end

-- custom ftdetect

local ft_map = {
  { pattern = { "Jenkinsfile*" }, ft = "groovy" },
  { pattern = { "Dockerfile*" }, ft = "dockerfile" },
  { pattern = { "*.qml" }, ft = "qmljs" },
}

for _, v in ipairs(ft_map) do
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = v.pattern,
    callback = function()
      vim.cmd(string.format("set filetype=%s", v.ft))
    end,
  })
end
