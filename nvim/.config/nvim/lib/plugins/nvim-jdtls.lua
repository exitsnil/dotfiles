return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")

    local root_dir = vim.fs.root(0, {
      "gradlew",
      "mvnw",
      ".git",
      "pom.xml",
      "build.gradle",
      "settings.gradle",
    })

    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

    local config = {
      cmd = {
        "jdtls",
        "-data",
        workspace_dir,
      },
      root_dir = root_dir,
    }

    jdtls.start_or_attach(config)
  end,
}
