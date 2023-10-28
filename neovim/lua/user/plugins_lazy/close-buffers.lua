-- Close several buffers at once; close buffers while preserving windows
return {
  'kazhala/close-buffers.nvim',
  config = function()
    require('close_buffers').setup {
      -- Types of deletion that should preserve window layout:
      preserve_window_layout = { 'this', 'nameless' }
    }
  end
}
