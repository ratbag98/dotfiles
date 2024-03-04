{ config, pkgs, lib, ...}: 
{
  home = {
    stateVersion = "23.05";
    packages = with pkgs; [ 
      zoxide 
      pkgs.vim 
      fzf
      pkgs.ripgrep
    ];

    file = {
      ".vimrc".source = ./vim_configuration;
    };

    sessionVariables = {
    };
  };

  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        switch = "darwin-rebuild switch --flake ~/dotfiles/nix-darwin-configuration";
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;

      extraLuaConfig = lib.fileContents ../config/nvim/init.lua;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd cd" ];

    };

    fish = {
      enable = true;
      interactiveShellInit  = ''
        set fish_greeting # disable greeting
        '';
      plugins = [
      {name = "fzfi-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      ];
    };

    git = {
      enable = true;
      userName = "Robert Rainthorpe";
      userEmail = "rob.rainthorpe@me.com";
      ignores = [ ".CFUserTextEncoding" ".DS_Store" ".Trash/" "*.swp" ];
      extraConfig = {
        pull = {
          rebase = true;
        };
      };
      aliases = {
        st = "status";
        ci = "commit";
        co = "checkout";
        di = "diff";
        dc = "diff --cached";
        amend = "commit --amend";
        aa = "add --all";
        ff = "merge --ff-only";
        pullff = "pull --ff-only";
        noff = "merge --no-ff";
        fa = "fetch --all";
        pom = "push origin master";
        b = "branch";
        ds = "diff --stat=160,120";
        dh1 = "diff HEAD~1";
        div = "divergence";
        head = "!git l -1";
        h = "!git head";
        r = "!git l -30";
        ra = "!git r --all";
        la = "!git l --all";
      };
    };
  };
}
