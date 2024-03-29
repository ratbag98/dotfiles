{ config, pkgs, ... }:

let user = "rob"; in

{
  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
  ];
  
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    settings.trusted-users = [ "@admin" "${user}"];

    extraOptions = '' 
      experimental-features = nix-command flakes
    '';
  };

  system.checks.verifyNixPath = false;

  # Load configuration shared across all Darwin machines
  environment.systemPackages = with pkgs; [
    # home-manager
    # git
    # wget
    # less
    # iterm2
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });


  fonts.fontDir.enable = true;

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


# Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    zsh.enable = true;
    fish  = {
      enable = true;
      interactiveShellInit = ''
        eval (/opt/homebrew/bin/brew shellenv)
      '';
    };
  };

}


