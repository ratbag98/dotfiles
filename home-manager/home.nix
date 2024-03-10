{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./tmux.nix
  ];

  home = {
    stateVersion = "23.11";
    packages = with pkgs; [
      bandwhich
      bat
      bench
      curlFull
      du-dust
      dua
      duf
      eza
      fd
      gawk
      gnused
      gnutar
      html-tidy
      inlyne
      mc
      mosh
      nano
      neofetch
      nmap
      nixpkgs-fmt
      pandoc
      paperkey
      poppler_utils
      procs
      qrencode
      ripgrep
      sd
      ssh-copy-id
      vim
      zoxide
    ];

    file = {
      ".vimrc".source = ./vim_configuration;
      ".tool-versions".source = ../config/asdf/tool-versions;
      ".pandoc.yaml".source = ../config/pandoc/pandoc.yaml; # TODO need a Linux version
      ".pylintrc".source = ../config/python/pylintrc;

    };

    sessionVariables = { };
  };
  xdg.enable = true;
  xdg.configFile."procs/config.toml".source = ../config/procs/config.toml;
  xdg.configFile."mc".source = ../config/mc;
  xdg.configFile."neofetch".source = ../config/neofetch;
  #  xdg.configFile."fish/completions/nix.fish".source = "${pkgs.nix}/share/fish/vendor_completions.d/nix.fish";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";

}
