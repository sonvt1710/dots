![Rust](https://img.shields.io/badge/Rust-1.69.x-%23000000.svg?style=plastic&logo=rust&logoColor=white)
![Neovim version](https://img.shields.io/badge/Neovim-0.9.x-57A143?style=plastic&logo=neovim)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=plastic&logo=lua&logoColor=white)
![YouTubeSubs](https://img.shields.io/youtube/channel/subscribers/UC4S7Fm5x-WXRCWP6MjK6k2A?style=social)
<a href="https://www.redbubble.com/shop/ap/102956214"><img align="right" width="100" height="100" src="https://user-images.githubusercontent.com/8049061/155224899-71324823-4cc0-431a-90e5-63e3c51af05f.png"></a>

# Public version of CodeSmell's Dotfiles 💩 

## Current Setup 
_Last Updated: February 21st, 2023 or more recently._

- **[Rust](https://www.rust-lang.org/)** 🦀⚙
	- [compiler](https://rustup.rs/) version: `rustc 1.69.0-nightly (5243ea5c2 2023-02-20)`
	- [rust-analyzer](https://rust-analyzer.github.io/manual.html#nvim-lsp) version: `rust-analyzer (b75803ad3 2023-01-30)`
- **[Neovim](https://neovim.io/)** - _Important Note_: these Dotfiles target bleeding edge Neovim APIs. I try to update these runtime files as soon as the Neovim team pushes changes (including & especially breaking) to [their master branch](https://git.io/NeovimHEAD) and I pull the latest. 
  - I usually pull the latest a few times per week or if I see that a particularly juicy PR has landed. I do test Neovim feature branches. But, only code that works with `Neovim → master` will be pushed to this repo. [Neovim 0.8](https://github.com/neovim/neovim/releases/tag/v0.8.0) should work with most of what you see here. 
  - However, a lot of API changes are coming out of Neovim on the 0.6 track (master). So, I'd recommend using [Neovim Nightly](https://github.com/neovim/neovim/releases/tag/nightly) to use all the goodness in these Dotfiles. Or, [building from source](https://github.com/neovim/neovim#install-from-source) - [Code Smell video instructions](https://youtu.be/wep2_b_QU7Q). It's unlikely that I am more than a day or 2 behind. 
  - The Neovim [commit](https://github.com/neovim/neovim/commit/fec1181ecde75de1754f1d27a7ba7cbf2b9f43d6) that I am on: `NVIM v0.9.0-dev-1017+gfec1181ec`
	- Theme: [codesmell_dark](https://github.com/whatsthatsmell/codesmell_dark.vim)
	  - `Telescope`, `nvim-cmp`, `GitSigns`, many other plugins and builtins are colored from this theme using `Treesitter 🌲` 
	- Config: [Lua](https://neovim.io/doc/user/lua.html)
	- Package Management: [Packer](https://github.com/wbthomason/packer.nvim)
	- Featuring: `Telescope 🔭`, `gitsigns`, `nvim-cmp`, `Treesitter` and all the LSP goodness
- [Alacritty](https://github.com/alacritty/alacritty) with tmux and some [iTerm Hotkey Windows](https://www.iterm2.com/)
    - Zsh Theme: [code-smell.zsh-theme](https://github.com/whatsthatsmell/dots/blob/master/public%20dots/zsh/code-smell.zsh-theme)
		- Font: `JetBrainsMono Nerd Font Mono`
- Zsh  
    - [Oh My Zsh](https://ohmyz.sh/) - _For now_

_I update my private Dotfiles on a regular basis. They're in a private repo. However, I try to keep these up-to-date. Use Git's history to look at files as they were in the past. If you are looking for a file that is not here anymore, please look through the Git history. [Call me out in the comments](https://www.youtube.com/CodeSmell) if you see something that isn't in this repo._

Another awesome feature from [gitsigns](https://github.com/lewis6991/gitsigns.nvim/commit/584e1abfb9a4bc7f42409c4164f99028b57330b2) and a map for it:
```lua
-- toggle Virtual deleted lines
key_map("n", ",td", [[<Cmd>lua require'gitsigns'.toggle_deleted()<CR>]], { noremap = true, silent = true })
```

https://git.io/CodeSmell
