<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=300px></p>

<p align="center">
<a href="https://hyprland.org/"><img src="https://img.shields.io/static/v1?label=Hyprland&message=master&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/></a>
 <a href="https://github.com/"><img src="https://img.shields.io/static/v1?label=Nix Flake&message=check&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"></a>
</p>

<p align="center">
<a href="https://nixos.org/"><img src="https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4"></a> 


<p align="center"><img src="https://i.imgur.com/NbxQ8MY.png" width=600px></p>

<h2 align="center">Corentin NixOS Dotfiles</h2>


### Apps:

|                          |             NixOS 23.05               |
|--------------------------|:-------------------------------------:|
| **Desktop Environment**  |   [Hyprland](https://hyprland.org)      |
| **Terminal Emulator**    |   [Cool-Retro-Term](https://github.com/Swordfish90/cool-retro-term) |
| **Display Server**       |   [Wayland](https://wayland.freedesktop.org)     |
| **Application Launcher** |   [Rofi](https://github.com/davatorium/rofi)  |
| **Shell**                |   [Zsh](https://zsh.sourceforge.io)   |
| **Text Editor**          |   [Neovim](https://neovim.io)         |


### DE/WM

**Hyprland**

Desktop Environment:

<p align="center"><img src="https://i.imgur.com/S4XT0ZF.png"></p>
<p align="center"><img src="https://i.imgur.com/0Lq4rOe.png"></p>

## Nix Dotfiles Directory Structure
```
├── home
│  ├── programs
│  │   ├── alacritty
│  │   ├── hypr
│  │   ├── kitty
│  │   ├── rofi
│  │   ├── waybar
│  │   └── zsh
│  ├── scripts
│  ├── themes
│  │   └── cava
│  ├── wallpapers
│  └── home.nix
├── host
│  └── desktop
│      └── fonts
│      └── virtualisation
├── nixos
│  ├── configuration.nix
│  └── hardware-configuration.nix
├── flake.nix
└── install.sh
```

### Installation

0. Download the project:
```bash
 $ git clone https://github.com/HeinzDev/Nix-Dotfiles.git | cd Hyprland-dotfiles.git
```

1. Install the project:

```bash
$ chmod +x install.sh
$ ./install.sh
```
or

```bash
$ cd Hyprland-dotfiles
$ sudo nixos-rebuild switch --flake .#enzo
```


### Credit
* [Hyprland-dotfiles](https://github.com/HeinzDev/Hyprland-dotfiles)