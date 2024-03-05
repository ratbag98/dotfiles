{
  description = "Rob's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin = {

      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, darwin, flake-utils, home-manager, ... }:
  {
    darwinConfigurations = {
      "mbp" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./darwin/darwin.nix
            home-manager.darwinModules.home-manager  {
              home-manager = {
                users.rob = import ./home-manager/home.nix;
              };
              users.users.rob.home = "/Users/rob";
            }
        ];
        specialArgs = { inherit inputs; };
      };
      "TestLaptop" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./darwin/darwin.nix
            home-manager.darwinModules.home-manager  {
              home-manager = {
                users.rob = import ./home-manager/home.nix;
              };
              users.users.rob.home = "/Users/rob";
            }
        ];
        specialArgs = { inherit inputs; };
      };
    };
    # for future expansion
    # nixosConfigurations = {
    #   "nixos_machine" = inputs.nixpkgs.lib.nixosSystem {
    #     system = "x86_64-linux";
    #     modules = [
    #       ./nixos/configuration.nix
    #       ./config/wsl
    #       home-manager.nixosModules.home-manager
    #       {
    #         home-manager.users.nixos = import ./home/home.nix;
    #       }
    #     ];
    #   };
    # };
  };
}
