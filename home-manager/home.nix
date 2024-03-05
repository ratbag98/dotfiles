{ config, pkgs, lib, ...}: 

{
  imports = [
    ./nvim.nix
    ./git.nix
    ./tmux.nix
  ];

  home = {
    stateVersion = "23.11";
    packages = with pkgs; [ 
      asciinema-agg
      automake
      bandwhich
      bat
      bench
      cmake
      curlFull
      dos2unix
      du-dust
      dua
      duf
      eza
      fd
      fzf
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
      pandoc
      paperkey
      poppler_utils
      procs
      qrencode
      ripgrep
      ssh-copy-id
      vim 
      zoxide 
    ];

    file = {
      ".vimrc".source = ./vim_configuration;
      ".tool-versions".source = ../config/asdf/tool-versions;
      ".pandoc.yaml".source = ../config/pandoc/pandoc.yaml; # TODO need a Linux version
    };

    sessionVariables = {
    };
  };
  xdg.enable = true;
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        switch = "darwin-rebuild switch --flake ~/dotfiles/";
      };
    };

    lazygit = {
      enable = true;
    };

    tealdeer = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd cd" ];

    };

    bottom = {
      enable = true;
      settings = {
        temperature_type = "celsius";
        tree = false;
        show_table_scroll_position = true;
      };
    };

    jq = {
      enable = true;
    };

    fish = {
      enable = true;
      interactiveShellInit  = ''
        set fish_greeting # disable greeting
        '';
      plugins = [
      {name = "fzfi-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      ];

      functions = {
      };

      shellAliases = {
        cat = "bat";
        ll = "eza -l -g --icons $argv";
        vim = "nvim";
      };
    };
  };
}
