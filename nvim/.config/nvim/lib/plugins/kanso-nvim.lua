return {
  "webhooked/kanso.nvim",
  config = function()
    local kanso = require("kanso")

    kanso.setup({
      dark = "saturated"
    })
  end
}
