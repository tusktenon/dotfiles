require('jdtls').start_or_attach {
  cmd = { vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls' },
  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),
}
