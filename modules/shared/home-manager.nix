
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
       active_border_color = "green";
       enable_audio_bell = "no";
       bell_on_tab = "no";

       tab_bar_edge = "top";
       tab_title_template  = "{fmt.fg.c2c2c2}{title}";
       active_tab_title_template  = "{fmt.fg._fff}{title}";
       tab_bar_style =  "separator";
       tab_separator = " |";

       remember_window_size = "no";
       initial_window_width = "96c";
       initial_window_height = "32c";
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
    extraLuaPackages = ps: [ ps.jsregexp ]; 
   # package = pkgs.neovim; # -nightly;
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

  ranger = {
    enable = true;
    extraConfig = ''
      set preview_images_method kitty
    '';
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

    # delta = {
    #   enable = true;
    # };

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
