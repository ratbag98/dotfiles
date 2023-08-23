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

and install plugins:

```bash
fisher update
```
