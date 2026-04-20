{ pkgs, ... }:

{
  home.stateVersion = "25.11";  # Or current year

  home.username = "chase";  # Change to match above
  home.homeDirectory = "/Users/chase";

  # Shell configuration (zsh example)
  programs.zsh.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "ChaseKnowlden";
    userEmail = "haroldknowlden@gmail.com";
  };
}