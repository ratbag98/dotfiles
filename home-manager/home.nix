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
      zoxide 
      vim 
      fzf
      ripgrep
      fd
      eza
      bat
      curlFull
      mc
      mosh
      nano
      neofetch
      nmap
      pandoc
      inlyne
      asciinema-agg
      poppler_utils
      bandwhich
      du-dust
      dua
      procs
    ];

    file = {
      ".vimrc".source = ./vim_configuration;
    };

    sessionVariables = {
    };
  };
  xdg.enable = true;
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        switch = "darwin-rebuild switch --flake ~/dotfiles/nix-darwin-configuration";
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
