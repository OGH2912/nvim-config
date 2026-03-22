return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_restore = false,
      auto_save = true,
      auto_create = false,
      session_lens = {
        load_on_setup = true,
        previewer = "active_buffer"
      }
    })
  end
}

