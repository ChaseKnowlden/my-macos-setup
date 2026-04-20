{ pkgs, username, ... }:

{
  home.stateVersion = "25.11";  # Or current year

  home.username = username;

  # Shell configuration (zsh example)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "ChaseKnowlden";
    userEmail = "haroldknowlden@gmail.com";
  };
}