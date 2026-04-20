# hosts/YourHostName/default.nix
{ pkgs, ... }:
{ 
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;
  # bash is enabled by default

  homebrew = {
    enable = true;
    autoUpdate = true;
    casks = [
      "raycast"
      "rectangle"
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.chase = { pkgs, ... }: {
    home.stateVersion = "25.11"; # read below
  };
}