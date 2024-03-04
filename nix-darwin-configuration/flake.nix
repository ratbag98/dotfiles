{
  description = "Rob's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  {
    darwinConfigurations = {
      "mbp" = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./darwin.nix
            home-manager.darwinModules.home-manager  {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                users.rob = import ../home-manager/home.nix;
              };
              users.users.rob.home = "/Users/rob";
            }
        ];
      };
      "TestLaptop" = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./darwin.nix
            home-manager.darwinModules.home-manager  {
              home-manager = {
                users.rob = import ../home-manager/home.nix;
              };
              users.users.rob.home = "/Users/rob";
            }
        ];
      };
    };
  };
}
