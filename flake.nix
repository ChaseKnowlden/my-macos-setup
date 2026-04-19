{
  description = "My macOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin"; # newest version as of may 2023, probably needs to get updated in november
    home-manager.url = "github:nix-community/home-manager/release-25.11"; # ...
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
    darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs"; # ...
  };

  # add the inputs declared above to the argument attribute set
  outputs = { self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations."Mac" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/Mac/default.nix 
      ];
    };
  };
}