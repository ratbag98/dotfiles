# Nix-based setup

1. Install Nix

```bash
xcode-select --install
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Clone this repo to `~/dotfiles` or similar.

```bash
git clone git@github.com://github.com/ratbag98/dotfiles.git
chmod +x apps/aarch64-darwin/apply
chmod +x apps/aarch64-darwin/build
chmod +x apps/aarch64-darwin/build-switch
chmod +x apps/aarch64-darwin/rollback
```

3. Backup and remove any existing `~/.config`.

4. Build the setup.

```bash
nix run .#build
```

5. Assuming no errors, run the setup:

```bash
nix run .#build-switch
```

6. Open a new terminal and enjoy.


