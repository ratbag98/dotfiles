{ lib, pkgs, ...}: 

{  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

#  extraLuaConfig = lib.fileContents ../config/nvim/init.lua;
  };
}
