{ pkgs, ... }:

{
  # Basic system settings
  system.stateVersion = 5;  # Don't change this after initial setup

  # Enable flakes and nix-command by default
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages (e.g. some apps, fonts, etc.)
  nixpkgs.config.allowUnfree = true;

  # Services
  services.nix-daemon.enable = true;

  # You can add Homebrew casks here if you want nix-darwin to manage them
  homebrew = {
    enable = true;
    casks = [
      "raycast"
      "rectangle"
    ];
  };
}