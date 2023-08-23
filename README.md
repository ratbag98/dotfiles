dotfiles
========

Fish config is excluded deliberately - it doesn't have a clean host-specific configuration mechanism.

Clone the repo then

```bash
cd
chmod +x dotfiles/setup.sh
dotfiles/setup.sh
```
Restart terminal. Copy the fish plugins file over:

```bash
cp dotfiles/fish_plugins ~/.config/fish`
```

and install:

```bash
fisher update
```
