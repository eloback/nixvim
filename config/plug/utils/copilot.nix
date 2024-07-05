_: {
  plugins.copilot-chat = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>Ac";
      action = "<CMD>CopilotChatToggle<CR>";
      options.desc = "Toggle Copilot Chat Window";
    }
    {
      key = "<leader>As";
      action = "<CMD>CopilotChatStop<CR>";
      options.desc = "Stop current Copilot output";
    }
    {
      key = "<leader>At";
      action = "<CMD>CopilotChatTests<CR>";
      options.desc = "Add tests for my code";
    }
    {
      mode = "x";
      key = "<leader>a";
      action = "+copilot";
    }
    {
      mode = "x";
      key = "<leader>ar";
      action = "<CMD>CopilotChatReview<CR>";
      options.desc = "Review the selected code";
    }
    {
      mode = "x";
      key = "<leader>ae";
      action = "<cmd>CopilotChatExplain<cr>";
    }
    {
      mode = "x";
      key = "<leader>af";
      action = "<cmd>CopilotChatFix<cr>";
    }
    {
      mode = "x";
      key = "<leader>ad";
      action = "<cmd>CopilotChatDocs<cr>";
    }
    {
      mode = "x";
      key = "<leader>ac";
      action = "<cmd>CopilotChatCommit<cr>";
    }
  ];
}
