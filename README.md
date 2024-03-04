# New dotfiles

Now with added Nix-ness.

1. Install Nix: https://github.com/DeterminateSystems/nix-installer
2. Clone this
3. 

dotfiles
========

Fish config is excluded deliberately - it doesn't have a clean host-specific configuration mechanism.

Clone the repo then

```bash
cd
chmod +x dotfiles/setup.sh
dotfiles/setup.sh
```
Restart terminal. Copy fish files into place

```bash
cp -R dotfiles/fish/* ~/config/fish
```

and install plugins:

```bash
fisher update
```

Add `asdf` to fish config. Add the following to `.config/fish/config.fish`:

```text
source ~/.asdf/asdf.fish
````
