local M = {}

function M.signal(opts)
  opts = opts or {}
  local copy_mode = opts.copy or false
  
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  require('telescope.builtin').current_buffer_fuzzy_find({
    previewer = false,
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.92,
      height = 0.92,
    },
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          if copy_mode then
            vim.fn.setreg('+', selection.text)
          else
            print(selection.text)
          end
        end

        vim.cmd('quit!')
      end)

      map('i', '<esc>', function()
        actions.close(prompt_bufnr)
        vim.cmd('quit!')
      end)

      map('n', '<esc>', function()
        actions.close(prompt_bufnr)
        vim.cmd('quit!')
      end)

      return true
    end,
  })
end

return M
