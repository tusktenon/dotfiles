-- Language-specific plugins
return {
  -- Java
  { 'nvim-java/nvim-java' },

  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false, -- This plugin is already lazy
  },
}
