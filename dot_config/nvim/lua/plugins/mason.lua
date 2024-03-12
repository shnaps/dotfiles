return {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "stylua",
        -- "checkstyle",
        "google-java-format",
        "sonarlint-language-server",
        "java-debug-adapter",
        "clang-format",
      },
    },
  }
