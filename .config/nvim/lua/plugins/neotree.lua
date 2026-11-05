return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- opcional, mas recomendado para ícones
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree", -- Garante que o comando seja registrado no Neovim
  keys = {
    { "<leader>n", "<cmd>Neotree filesystem reveal right<CR>", desc = "Neo-tree reveal" },
  },
  opts = {},
}
