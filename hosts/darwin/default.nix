{ config, pkgs, ... }:

let user = "rob"; in

{
  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
    ../../modules/shared/cachix
  ];
  
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    settings.trusted-users = [ "@admin" "${user}"];

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    extraOptions = '' 
      experimental-features = nix-command flakes
    '';
  };

  system.checks.verifyNixPath = false;

  # Load configuration shared across all Darwin machines
  environment.systemPackages = with pkgs; [
    # emacs-unstable
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });


  security.pam.enableSudoTouchIdAuth = true;

  system = {

    stateVersion = 4;
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        show-process-indicators = false;
        show-recents = false;
        static-only = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        FXEnableExtensionChangeWarning = false;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        "com.apple.keyboard.fnState" = true;
      };
    };
  };


  programs = {
    # Create /etc/zshrc that loads the nix-darwin environment.
    zsh.enable = true;

    fish  = {
      enable = true;
    };
  };

}


