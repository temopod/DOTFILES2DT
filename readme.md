# My LXC Development Environment (Dotfiles)

This repository contains the configuration files and automated setup script for my isolated, resource-constrained LXC development container (Ubuntu 25.04).

## System Specifications
- **CPU:** 1 Core
- **RAM:** 2 GB
- **OS:** Ubuntu 25.04

## Features & Tools Installed
This setup automates the installation and configuration of a modern CLI environment:
- **Zsh & Oh My Zsh:** Features the `Powerlevel10k` theme and Nerd Fonts support.
- **Plugins:** `zsh-autosuggestions` and `zsh-syntax-highlighting` for efficiency.
- **Modern CLI Utilities:**
  - `bat` (Syntax-highlighted `cat` replacement)
  - `eza` (Modern `ls` replacement with Nerd Font icons)
  - `fzf` (Command-line fuzzy finder)
  - `zoxide` (Smart `cd` alternative)
- **Neovim IDE:** Configured via `lazy.nvim` with a file explorer (Neo-tree), syntax highlighting (Treesitter), fuzzy finding (Telescope), a status line (Lualine), and LSP support.

## How to Install

Run the following command inside the target machine to clone the repository and execute the setup script:

```bash
git clone https://github.com/temopod/DOTFILES2DT.git && cd DOTFILES2DT && bash setup.sh
