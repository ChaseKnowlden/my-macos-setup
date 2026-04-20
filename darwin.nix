{ pkgs, username, ... }:

{
  # Basic system settings
  system.stateVersion = 5;  # Don't change this after initial setup

  nix.enable = false;   # Let Determinate manage Nix instead of nix-darwin

  # Enable flakes and nix-command by default
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.zsh;   # or pkgs.bash, etc.
  };

  # Allow unfree packages (e.g. some apps, fonts, etc.)
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = username;

  # You can add Homebrew casks here if you want nix-darwin to manage them
  homebrew = {
    enable = true;
    casks = [
      "raycast"
      "rectangle"
      "alt-tab"
      "hiddenbar"
      "stats"
    ];
  };
}