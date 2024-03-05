{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.home-manager
      pkgs.git
      pkgs.wget
      pkgs.less
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
    brews = [ 
      "automake"
      "awk"
      "bench"
      "cmake"
      "coreutils"
      "diffutils"
      "dos2unix"
      "duf"
      "ffmpeg"
      "findutils"
      "fop"
      "fwup"
      "gd"
      "gdbm"
      "gnu-indent"
      "gnu-sed"
      "gnu-tar"
      "grep"
      "jq"
      "lego"
      "libdvdcss"
      "libepoxy"
      "libffi"
      "libksba"
      "librsvg"
      "libusb-compat"
      "libxslt"
      "libyaml"
      "mas"
      "npth"
      "paperkey"
      "pgformatter"
      "pinentry"
      "pkg-config"
      "popt"
      "portmidi"
      "postgresql@15"
      "pth"
      "pwgen"
      "qrencode"
      "recode"
      "rename"
      "shellcheck"
      "sqlite"
      "squashfs"
      "ssh-copy-id"
      "tcl-tk"
      "tidy-html5"
      "unixodbc"
      "watch"
      "wxwidgets"
      "xmlto"
      "xxhash"
      "zbar"
      "zlib"
      ];
    casks = [  
      "basictex"
      "font-fira-code-nerd-font"
      "font-meslo-lg-nerd-font"
      "keycastr"
      "font-jetbrains-mono-nerd-font"
      "raycast"
      "obsidian"
    ] ;
    masApps = {
      "com.kirsteins.chords-and-scales-mac" = 1435473426;
      "FileBot" = 905384638;
      "Final Cut Pro" = 424389933;
      "GoPro Player" = 1460836908;
      "Keynote" = 409183694;
      "Kindle" = 302584613;
      "Logic Pro" = 634148309;
      "Mactracker" = 430255202;
      "Metadatics" = 554883654;
      "MIDI Loupe" = 507075182;
      "MindNode" = 1289197285;
      "Motion" = 434290957;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "PCalc" = 403504866;
      "PDF Expert" = 1055273043;
      "Remote Desktop" = 409907375;
      "Speedtest" = 1153157709;
      "Telegram" = 747648890;
      "TestFlight" = 899247664;
      "TNEF's Enough" = 986621173;
      "WhatsApp" = 1147396723;
      "WiFi Explorer" = 494803304;
      "Wipr" = 1320666476;
      "Xcode" = 497799835;
      "Yubico Authenticator" = 1497506650;
      "ZOA" = 1581881354;
    };
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

