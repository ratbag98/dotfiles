# Nix-based setup

1. Install homebrew

Should be available via Nix, but seems to be a problem so:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Install Nix

```bash
xcode-select --install
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

3. Clone this repo to `~/dotfiles` or similar.

```bash
git clone git@github.com://github.com/ratbag98/dotfiles.git
chmod +x apps/aarch64-darwin/apply
chmod +x apps/aarch64-darwin/build
chmod +x apps/aarch64-darwin/build-switch
chmod +x apps/aarch64-darwin/rollback
```

4. Backup and remove any existins `~/.config`.

5. Build the setup.

```bash
nix run .#build
```

6. Assuming no errors, run the setup:

```bash
nix run .#build-switch
```

7. Open a new terminal and enjoy.


