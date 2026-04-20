{
  description = "My personal macOS setup with nix-darwin + Home Manager";

  inputs = {
    # Unstable nixpkgs (most up-to-date packages)
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # nix-darwin for system configuration
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager for user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";          # Use "x86_64-darwin" for Intel Macs
      hostname = "MacBook";            # Run `scutil --get LocalHostName` to get yours
      username = "chase";          # Your macOS username (check with `whoami`)

      specialArgs = { inherit inputs username; };

      darwinConfiguration = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          ./darwin.nix          # System configuration (create this next)
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home.nix;  # User configuration
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    in
    {
      darwinConfigurations.${hostname} = darwinConfiguration;

      # Optional: A convenience app to rebuild the config
      apps.${system}.default = {
        type = "app";
        program = "${darwinConfiguration.system}/sw/bin/darwin-rebuild";
      };
    };
}