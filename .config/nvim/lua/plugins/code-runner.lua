return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        c = {
          "cd $dir &&",
          "gcc $fileName -o /tmp/$fileNameWithoutExt &&",
          "/tmp/$fileNameWithoutExt"
        },
      },
    })

    vim.keymap.set("n", "<leader>rc", ":RunCode<CR>", { desc = "Correr código" })
  end,
}