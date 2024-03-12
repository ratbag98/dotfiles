{ pkgs }:

with pkgs; [
  bandwhich
  bat
  bench
  coreutils
  curlFull
  du-dust
  dua
  duf
  eza
  fd
  html-tidy
  inlyne
  mc
  meslo-lgs-nf
  mosh
  nano
  neofetch
  nixpkgs-fmt
  nmap
  pandoc
  paperkey
  poppler_utils
  procs
  qrencode
  ripgrep
  sqlite
  tree
  wget
  zip
  zoom-us
  zoxide

# Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs
]
