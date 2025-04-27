return {
  'jay-babu/mason-nvim-dap.nvim',
  opts = {
    -- This line is essential to making automatic installation work
    -- :exploding-brain
    handlers = {},
  },
  dependencies = {
    'mfussenegger/nvim-dap',
    'williamboman/mason.nvim',
  },
}
