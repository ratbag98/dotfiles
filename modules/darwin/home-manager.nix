{ config, pkgs, lib, home-manager, ... }:

let
  user = "rob";
  # Define the content of your file as a derivation
   sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
  # ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    taps = pkgs.callPackage ./taps.nix {};
    casks = pkgs.callPackage ./casks.nix {};
    brews = pkgs.callPackage ./brews.nix {};

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
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
      "WiFi Explorer" = 494803304;
      "Wipr" = 1320666476;
#      "Xcode" = 497799835;
      "Yubico Authenticator" = 1497506650;
      "ZOA" = 1581881354;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
        ];
        stateVersion = "23.11";
      };
      programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };
      
      xdg.enable = true;  
      xdg.configFile."procs".source = ../../config/procs;
      xdg.configFile."bat".source = ../../config/bat;
      xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";

      manual.manpages.enable = true;
    };
  };

  # Fully declarative dock using the latest from Nix Store
#  local.dock.enable = true;
#  local.dock.entries = [
#    { path = "/Applications/Slack.app/"; }
#    { path = "/System/Applications/Messages.app/"; }
#    { path = "/System/Applications/Facetime.app/"; }
#    { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
#    { path = "/System/Applications/Music.app/"; }
#    { path = "/System/Applications/News.app/"; }
#    { path = "/System/Applications/Photos.app/"; }
#    { path = "/System/Applications/Photo Booth.app/"; }
#    { path = "/System/Applications/TV.app/"; }
#    { path = "/System/Applications/Home.app/"; }
#        {
#      path = "${config.users.users.${user}.home}/.local/share/";
#      section = "others";
#      options = "--sort name --view grid --display folder";
#    }
#    {
#      path = "${config.users.users.${user}.home}/.local/share/downloads";
#      section = "others";
#      options = "--sort name --view grid --display stack";
#    }
#  ];

}
