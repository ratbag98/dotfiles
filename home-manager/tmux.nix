{pkgs, lib, ...}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 0;
    mouse = true;
    clock24 = true;

    sensibleOnTop = false;
    prefix = "C-a";
    escapeTime = 10;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";

    extraConfig = lib.fileContents ../config/tmux/tmux.conf;

    plugins = with pkgs.tmuxPlugins; [
      fuzzback
      logging
      pain-control
      sessionist
      tmux-thumbs
      yank
    ];
  };
}
