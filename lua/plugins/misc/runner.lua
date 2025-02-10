-- Alternative: stevearc/overseer.nvim
return {
  "gitpushjoe/zuzu.nvim",
  keys = {
    {
      "<leader>r1",
      function()
        require("zuzu").run(1, 1)
      end,
      desc = "Run build configuration 1",
    },
    {
      "<leader>r2",
      function()
        require("zuzu").run(2, 1)
      end,
      desc = "Run build configuration 2",
    },
    {
      "<leader>r3",
      function()
        require("zuzu").run(3, 1)
      end,
      desc = "Run build configuration 3",
    },
    {
      "<leader>r4",
      function()
        require("zuzu").run(4, 1)
      end,
      desc = "Run build configuration 4",
    },
    {
      "<leader>rr",
      function()
        require("zuzu").reopen(1)
      end,
      desc = "Reopen last configuration",
    },
    {
      "<leader>r+",
      function()
        require("zuzu").new_project_profile()
      end,
      desc = "Create new profile",
    },
    {
      "<leader>r/",
      function()
        require("zuzu").new_profile()
      end,
      desc = "Create new global profile",
    },
    {
      "<leader>r=",
      function()
        require("zuzu").edit_profile()
      end,
      desc = "Edit profile",
    },
    {
      "<leader>r?",
      function()
        require("zuzu").edit_all_applicable_profiles()
      end,
      desc = "Edit all applicable profiles",
    },
    {
      "<leader>r*",
      function()
        require("zuzu").edit_all_profiles()
      end,
      desc = "Edit all profiles",
    },
    {
      "<leader>rh",
      function()
        require("zuzu").edit_hooks()
      end,
      desc = "Edit hooks",
    },
    {
      "<leader>r[",
      function()
        require("zuzu").qflist_prev_or_next(false)
      end,
      desc = "Go to previous entry in qflist",
    },
    {
      "<leader>r]",
      function()
        require("zuzu").qflist_prev_or_next(true)
      end,
      desc = "Go to next entry in qflist",
    },
    {
      "<leader>r\\",
      function()
        require("zuzu").toggle_qflist(true)
      end,
      desc = "Toggle stable qflist",
    },
    {
      "<leader>r|",
      function()
        require("zuzu").toggle_qflist(false)
      end,
      desc = "Toggle qflist",
    },
  },
  config = function()
    require("zuzu").setup({
      build_count = 4,
      display_strategy_count = 1,
      keymaps = {
        build = { { "<leader>r1", "<leader>r2", "<leader>r3", "<leader>r4" } },
        reopen = { "" },
        new_profile = "",
        new_project_profile = "",
        edit_profile = "",
        edit_all_applicable_profiles = "",
        edit_all_profiles = "",
        edit_hooks = "",
        qflist_prev = "",
        qflist_next = "",
        stable_toggle_qflist = "",
        toggle_qflist = "",
      },
      display_strategies = {
        function(cmd)
          local height = 15
          vim.cmd("horizontal rightbelow split | resize " .. height .. " | terminal " .. cmd)
        end
      },
    })
  end,
}
