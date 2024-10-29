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
  # mosh # - 2024-10-29 fails
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
  (nerdfonts.override { fonts = ["JetBrainsMono" "FiraCode" "Meslo"]; })

# Node.js development tools
  # nodePackages.npm # globally install npm
  # nodePackages.prettier
  nodejs_22

  # neovim and other LSP client requirements
  taplo
  stylua
  lua-language-server
  tailwindcss-language-server
  vscode-langservers-extracted 
  nodePackages_latest.typescript-language-server

  # Python 
  black
  python3 # leave it at 3, otherwise multiple versions install
  ruff-lsp
  pyright

]
