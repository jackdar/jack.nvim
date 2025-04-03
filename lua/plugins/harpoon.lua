return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<M-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<M-t>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<M-n>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<M-s>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-Shift-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-Shift-N>', function()
      harpoon:list():next()
    end)
  end,
}
