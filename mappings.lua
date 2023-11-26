-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
     L = {
       function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
       desc = "Next buffer",
      },
    [">"]={"<cmd>>gv<cr>",desc = "After tab in re-select the some"},
    ["<"]={"<gv", desc ="After tab out re-select the same"},
    ["n"]={"nzzzv", desc ="Goes ta the next result on the seach and plut the cursor in the middle"},
    ["N"]={"Nzzzv",desc="Goes to the prev result on the seach and put the cursor in the middle"},
     H = {
       function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
       desc = "Previous buffer",
     },
    ["<leader>bdf"] = {"<cmd>tabnew<cr>", desc = "New tab"},
    ["<leader>bd"] = {"<cmd>bd!<cr>", desc = "Closes the buffer without saving changes"},

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
