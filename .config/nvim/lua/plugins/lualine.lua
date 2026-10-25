return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      -- O lazy.nvim já integra muito bem com o catppuccin, 
      -- mas se quiser forçar o tema do lualine para combinar, descomente a linha abaixo:
      -- theme = "catppuccin",
    },
    sections = {
      lualine_a = {
        {
          "filename",
          path = 1,
        },
      },
    },
  },
}
