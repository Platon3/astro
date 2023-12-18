return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
-- theme
 { import = "astrocommunity.colorscheme.catppuccin" },
  -- lsp
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.lua" },
  -- git
  { import = "astrocommunity.git.neogit" },
  

   

}
