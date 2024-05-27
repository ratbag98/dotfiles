{ config, pkgs, inputs, ... }:

let
  emacsOverlaySha256 = "06413w510jmld20i4lik9b36cfafm501864yq8k4vxl5r4hn0j0h";
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };

    # overlays = [ inputs.neovim-nightly-overlay.overlay];


    #  # Apply each overlay found in the /overlays directory
    #  let path = ../../overlays; in with builtins;
    #  map (n: import (path + ("/" + n)))
    #      (filter (n: match ".*\\.nix" n != null ||
    #                  pathExists (path + ("/" + n + "/default.nix")))
    #              (attrNames (readDir path)))
    #  #++ [(import (builtins.fetchTarball {
    #  #         url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    #  #     }))]
    #       ;

  };
}
