return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme material]])
      vim.g.material_style = "oceanic"
    end,
  },
}
