local yazi_bin =
  "C:/Users/msilva/AppData/Local/Microsoft/WinGet/Packages/sxyazi.yazi_Microsoft.Winget.Source_8wekyb3d8bbwe/yazi-x86_64-pc-windows-msvc"
if not vim.env.PATH:find(yazi_bin, 1, true) then
  vim.env.PATH = vim.env.PATH .. ";" .. yazi_bin
end

require("euliveiras.remap")
require("euliveiras.lazy_init")
require("euliveiras.set")
