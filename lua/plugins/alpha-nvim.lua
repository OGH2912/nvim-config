return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("n", "New Session", function()
        local name = vim.fn.input("Session name: ")
        if name ~= "" then
          vim.cmd("AutoSession save " .. name)
        end
      end),
      dashboard.button("s","Open Session", ":AutoSession search<CR>"),
      dashboard.button("f","Find file",":Telescope find_files<CR>"),
      dashboard.button("g","Search text",":Telescope live_grep<CR>"),
      dashboard.button("q","Quit",":qa<CR>")
    }

    alpha.setup(dashboard.config)
  end
}

