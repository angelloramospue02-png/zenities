return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local jdtls = require("jdtls")

    -- Rutas a los paquetes de debug que instala Mason
    local mason_path = vim.fn.stdpath("data") .. "/mason/"
    local bundles = {}

    -- java-debug-adapter
    local java_debug_path = mason_path .. "packages/java-debug-adapter/extension/server/"
    vim.list_extend(bundles, vim.split(vim.fn.glob(java_debug_path .. "com.microsoft.java.debug.plugin-*.jar"), "\n"))

    -- java-test (para correr tests con botones también, útil para tus materias)
    local java_test_path = mason_path .. "packages/java-test/extension/server/"
    vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "*.jar"), "\n"))

    local config = {
      cmd = { "jdtls" },
      root_dir = require("jdtls.setup").find_root({ "pom.xml", "build.gradle", ".git" }),

      settings = {
        java = {
          signatureHelp = { enabled = true },
          completion = { favoriteStaticMembers = {} },
        },
      },

      init_options = {
        bundles = bundles,
      },
    }

    jdtls.start_or_attach(config)

    -- Atajos específicos de Java (además de los generales de dap)
    vim.keymap.set("n", "<Leader>df", function() require("jdtls").test_class() end, { buffer = 0, desc = "Debug: correr clase de test" })
    vim.keymap.set("n", "<Leader>dn", function() require("jdtls").test_nearest_method() end, { buffer = 0, desc = "Debug: correr test más cercano" })
  end,
}