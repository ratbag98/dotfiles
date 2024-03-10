{ config, lib, pkgs, ...}: 

{  
# next line puts a read-only config directory link :(
#  xdg.configFile."nvim".source = ../config/nvim;

# this version puts a symlink to the dotfiles version, with
# write permission :)
  home.file."./.config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim"; 

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;

  };
}
