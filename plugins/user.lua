return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
   "andweeb/presence.nvim",
   {
     "ray-x/lsp_signature.nvim",
   event = "BufRead",
     config = function()
     require("lsp_signature").setup()
     end,
   },
  {
  opts = {
  size = 10,
  open_mapping = [[<F7>]],
  shading_factor = 2,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = { border = "Normal", background = "Normal" },
  },
},
  }.
   
}
