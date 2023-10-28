-- Color highlighting
return {
  'NvChad/nvim-colorizer.lua',
  opts = {
    user_default_options = {
      RGB = true,     -- #RGB hex codes
      RRGGBB = true,  -- #RRGGBB hex codes
      names = false,  -- Named colors
      rgb_fn = true,  -- rgb() and rgba()
      hsl_fn = true,  -- hsl() and hsla()
    }
  }
}
