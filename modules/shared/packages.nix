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
  htmlq
  inlyne
  jq
  mosh
  nano
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
  unzip
  wget
  xh
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


  taplo
  stylua
  lua-language-server
  tailwindcss-language-server
  vscode-langservers-extracted 
  nodePackages_latest.typescript-language-server

# Python 
  black
  python312
  ruff-lsp
  pyright
]
