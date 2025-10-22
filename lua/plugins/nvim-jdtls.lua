return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local function setup_jdtls()
      local home = os.getenv "HOME" or os.getenv "USERPROFILE"
      local jdtls_install_path = home
        .. "/.local/share/nvim/mason/packages/jdtls"

      local config = {
        cmd = { jdtls_install_path .. "/bin/jdtls" },
        root_dir = vim.fs.dirname(
          vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
        ),
        settings = {
          java = {
            format = {
              enabled = true,
              settings = {
                url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                profile = "GoogleStyle",
              },
            },
          },
        },
      }
      require("jdtls").start_or_attach(config)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        setup_jdtls()
      end,
    })
  end,
}
