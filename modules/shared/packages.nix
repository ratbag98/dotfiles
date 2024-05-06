{ pkgs }:

with pkgs; [
  anki-bin
  bandwhich
  bat
  coreutils
  curlFull
  du-dust
  dua
  duf
  eza
  fd
  gnupg
  html-tidy
  inlyne
  jq
  mc
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
  unzip
  zip
  zoom-us
  zoxide

  # fonts
  meslo-lgs-nf
  (nerdfonts.override { fonts = ["JetBrainsMono" "FiraCode"]; })

# Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs
]
