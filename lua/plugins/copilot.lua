return {
  'zbirenbaum/copilot.lua',
  cmd = 'CopilotEnable',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = '<M-l>',
          accept_word = '<M-k>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-l>',
        },
      },
    }
  end,
}
