return {
  -- Add the colorscheme plugin
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
