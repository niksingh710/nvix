{
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "copilot";
        providers.copilot = {
          #TODO: Implement claude 4
          # FIXME: Fix cursor movement changing window size
          model = "gpt-4.1";
          api_key_name = "OPENAI_API_KEY";
          endpoint = "https://api.githubcopilot.com";
          extra_request_body = {
            temperature = 0;
            max_tokens = 8192;
          };
        };
      };
    };
  };
}
