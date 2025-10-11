local home = os.getenv("HOME")

package.path = package.path .. ";" .. home .. "/.config/nvim/lib/?.lua"

require("plugins")
require("basic")
require("lsp")
