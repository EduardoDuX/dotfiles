return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Usa pcall para evitar erros de inicialização caso o plugin ainda esteja sendo baixado
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      -- Lista de parsers básicos essenciais para garantir que não falhe
      ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

      -- Instalação síncrona/assíncrona
      sync_install = false,

      -- Instala automaticamente parsers ausentes ao abrir arquivos
      auto_install = true,

      -- Habilita o sistema de destaque (highlight)
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
