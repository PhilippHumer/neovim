return {
  -- 1. Lade das base46 Plugin, welches das gruvchad Theme enthält
  {
    "AvengeMedia/base46",
    lazy = false,
    priority = 1000,
    config = function()
      -- Initialisiert das Colorscheme aus dem Plugin
      vim.cmd.colorscheme("base46-gruvchad")
    end,
  },

  -- 2. Konfiguriere LazyVim, damit es das Theme als aktiv erkennt
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base46-gruvchad",
    },
  },
}
