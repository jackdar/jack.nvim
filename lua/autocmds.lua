-- [[ Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set `number` and `relativenumber` to false when opening a terminals
-- See `:help TermOpen`
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Disable line numbering on terminal open',
  group = vim.api.nvim_create_augroup('termopen', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.api.nvim_create_user_command('DiffFormat', function()
  local lines = vim.fn.system('git diff --unified=0'):gmatch '[^\n\r]+'
  local ranges = {}
  for line in lines do
    if line:find '^@@' then
      local line_nums = line:match '%+.- '
      if line_nums:find ',' then
        local _, _, first, second = line_nums:find '(%d+),(%d+)'
        table.insert(ranges, {
          start = { tonumber(first), 0 },
          ['end'] = { tonumber(first) + tonumber(second), 0 },
        })
      else
        local first = tonumber(line_nums:match '%d+')
        table.insert(ranges, {
          start = { first, 0 },
          ['end'] = { first + 1, 0 },
        })
      end
    end
  end
  local format = require('conform').format
  for _, range in pairs(ranges) do
    format {
      range = range,
    }
  end
end, { desc = 'Format changed lines' })
