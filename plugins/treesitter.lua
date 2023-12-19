return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" } },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "lua"
        "angular",
    })
  end,
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "jdtls") end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = function(_, opts)
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      os.execute("mkdir " .. workspace_dir)

      -- get the current OS
      local os
      if vim.fn.has "mac" == 1 then
        os = "mac"
      elseif vim.fn.has "unix" == 1 then
        os = "linux"
      elseif vim.fn.has "win32" == 1 then
        os = "win"
      end

      -- ensure that OS is valid
      if not os or os == "" then
        require("astronvim.utils").notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
      end

      local defaults = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          vim.fn.expand "$MASON/share/jdtls/config",
          "-data",
          workspace_dir,
        },
}
