
{ config, pkgs, lib, ... }:

let name = "Rob Rainthorpe";
user = "rob";
email = "robr@robrainthorpe.com"; in
{
  kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 17;
     };
     shellIntegration.enableFishIntegration = true;
     theme = "Tokyo Night Storm";
     settings = {
        bold_font = "JetBrainsMono Nerd Font Mono ExtraBold";
        bold_italic_font = "JetBrainsMono Nerd Font Mono ExtraBold Italic";
        shell = "/Users/rob/.nix-profile/bin/fish";
        draw_minimal_borders = "yes";
        inactive_text_alpha = "0.7";
        hide_window_decorations = "no";
        active_border_color = "none";
        # enabled_layouts = "splits";
        # window_border_width = "0";
        enable_audio_bell = "no";
        bell_on_tab = "no";

        tab_bar_edge = "top";
        tab_title_template  = "{fmt.fg.c2c2c2}{title}";
        active_tab_title_template  = "{fmt.fg._fff}{title}";
        tab_bar_style =  "separator";
        tab_separator = " |";
     };
     keybindings = {
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+7" = "goto_tab 7";
      "cmd+8" = "goto_tab 8";
      "cmd+9" = "goto_tab 9";
     };
  };

  zsh.enable = true; 
  
  neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
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
      '';
    plugins = [
    { name = "fzfi-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    # https://github.com/PatrickF1/fzf.fish
    ];
  
    functions = { };
  
    shellAliases = {
      cat = "bat";
      ll = "eza -l -g --icons $argv";
      vim = "nvim";
    };
  };
  
  direnv = {
    enable = true;
  
    nix-direnv.enable = true;
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

  tmux = {
    enable = true;
    baseIndex = 0;
    mouse = true;
    clock24 = true;

    sensibleOnTop = false;
    prefix = "C-a";
    escapeTime = 10;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";


#    extraConfig = lib.fileContents ../config/tmux/tmux.conf;

    plugins = with pkgs.tmuxPlugins; [
      fuzzback
      logging
      pain-control
      sessionist
      tmux-thumbs
      yank
    ];
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

#    delta = {
#      enable = true;
#    };

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




}
