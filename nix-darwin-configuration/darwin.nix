{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.home-manager
  ];


  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

#  system.configurationRevision = self.rev or self.dirtyRev or null;

# Used for backwards compatibility. please read the changelog
# before changing: `darwin-rebuild changelog`.
  system.stateVersion = 4;


# Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    zsh.enable = true;
    fish.enable = true;
  };

  homebrew = {
    enable = true;
# onActivation.cleanup = "uninstall";

    taps = [];
    brews = [  ];
    casks = [ ] ;
  };

  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
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
}

