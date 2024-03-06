{ lib, pkgs, ...}: 

{  
  xdg.configFile."nvim".source = ../config/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

#  extraLuaConfig = lib.fileContents ../config/nvim/init.lua;
  };
}
