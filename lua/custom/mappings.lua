local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigatorLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigatorRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigatorDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigatorUp<CR>", "window up" },
  }
}

--[[
M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  }
}
--]]

return M
