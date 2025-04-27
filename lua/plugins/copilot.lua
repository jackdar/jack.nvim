return {
  'zbirenbaum/copilot.lua',
  cmd = 'CopilotEnable',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        -- auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = '<M-Tab>',
          accept_word = '<M-w>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-l>',
        },
      },
    }
  end,
}
