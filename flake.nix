{
  description = "My very own flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs :
  let inherit (self) outputs;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        ./config/configuration.nix
      ];
    };

    # homeConfigurations = {
    #   "marwan@nixos" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = { inherit inputs outputs; };
    #     modules = [ ./home.nix ];
    #   };
    # };

    homeConfigurations.marwan = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./home/home.nix ];
    };
  };
}
