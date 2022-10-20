require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<CR>", action = "edit_in_place" },
      },
    },
  },
})

local toggle = {}

function toggle.toggle_replace()
  local view = require"nvim-tree.view"
  if view.is_visible() then
    view.close()
  elseif vim.api.nvim_buf_get_name(0) == "" then
    require"nvim-tree".open_replacing_current_buffer()
  else
    require"nvim-tree".open_replacing_current_buffer()
  end
end

return toggle
