
{ config, pkgs, lib, ... }:

let name = "Rob Rainthorpe";
user = "rob";
email = "robr@robrainthorpe.com"; in
{
  wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("JetBrains Mono"),
        font_size = 17.0,
        color_scheme = 'tokyonight_storm',
        default_prog = {'/Users/rob/.nix-profile/bin/fish', '-l'},
        inactive_pane_hsb = {
          saturation = 0.8,
          brightness = 0.7,
        },
        scrollback_lines = 5000,
        quit_when_all_windows_are_closed = false,
      }
    '';
  };

  zsh.enable = true; 
  
  neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraLuaPackages = ps: [ ps.jsregexp ]; 
    # package = pkgs.neovim-nightly;
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
  
  fzf = {
    enable = true;
  #  enableFishIntegration = true;
  };
  
  fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
      set -x BAT_THEME tokyonight_storm
      '';
    plugins = [
    { name = "fzfi-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    # https://github.com/PatrickF1/fzf.fish
    ];
  
    functions = { };
  
    shellAliases = {
      cat = "bat";
      ll = "eza -l --git --hyperlink --no-permissions --icons $argv";
      vim = "nvim";
    };
  };
  
  direnv = {
    enable = true;
    enableBashIntegration = true;
  
    nix-direnv.enable = true;
  };


  yazi = {
    enable = true;
  };
  
  btop = {
    enable = true;
  };

  starship = {
    enable = true;
    enableFishIntegration = true;
  
    settings = {
      command_timeout = 1000;
      format = "[$all](dimmed white)";
  
      character = {
        success_symbol = "[❯](dimmed green)";
        error_symbol = "[❯](dimmed red)";
      };
  
      git_status = {
        style = "bold yellow";
        format = "([$all_status$ahead_behind]($style) )";
      };
  
      jobs.disabled = true;
    };
  };

  git = {
    enable = true;
    userName = "Rob Rainthorpe";
    userEmail = "robr@robrainthorpe.com";
    ignores = [ ".CFUserTextEncoding" ".DS_Store" ".Trash/" "*.swp" ];
    extraConfig = {
      pull = {
        rebase = true;
      };
    };

    difftastic = {
      enable = true;
      background = "dark";
    };

    aliases = {
      s = "status";
      sb = "status -sb"; # brief status
      co = "checkout";
      cob = "checkout -b"; # create and switch to branch
      del = "branch -D";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"; # list all branches
      aa = "add --all";
      undo = "reset HEAD~1 --mixed"; # Rollback Changes Locally
      res = "!git reset --hard"; # Clean All Uncommitted changes
      lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
      graph = "log --oneline --graph --decorate";
      gl = "config --global -l"; # Show all global git configuration
      amend = "commit --amend --no-edit"; # amend last commit
    };

  };




}
