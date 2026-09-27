<div align="center">

<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="140" alt="Catppuccin logo" />

# orien-config

### A version-controlled CachyOS + Hyprland workstation

**chezmoi · Hyprland · Caelestia · Zsh · Neovim · Ghostty · tmux · Yazi · systemd · Ollama**

*Preserve configuration, not accidental state.*

</div>

---

## What is this?

This repository is the configuration layer for my Linux workstation: user dotfiles, developer tooling, package inventories, and carefully separated machine-specific configuration.

It is managed with **[chezmoi](https://www.chezmoi.io/)**, but it is deliberately **not** a blind backup of `$HOME` or `/etc`. The goal is to keep the parts of the system that are worth reproducing while excluding credentials, sessions, caches, databases, browser state, and other accidental runtime data.

> [!IMPORTANT]
> The `machine/` directory contains reference snapshots for my Lenovo Legion system. It is documentation and recovery material, **not a generic install layer**. Review files before applying them to another machine.

## ✦ What's inside

| Area | What it demonstrates |
| --- | --- |
| **Desktop** | Hyprland + Caelestia overrides and workstation behavior |
| **Shell** | Zsh, Starship and terminal workflow |
| **Terminal / CLI** | Ghostty, tmux, Yazi, Fastfetch and Cava |
| **Editor** | Neovim configuration |
| **Workflow** | screenshot tooling, Swappy and personal scripts |
| **Input** | Keyd mappings |
| **Packages** | explicit pacman + AUR inventories |
| **System** | systemd, logind, module loading and hardware-specific configuration |
| **Legion** | power/profile and Linux hardware configuration |
| **Local AI** | Ollama service configuration |

## Repository map

```text
orien-config/
├── dot_config/             # chezmoi-managed user configuration
├── dot_local/              # personal scripts / user tooling
├── dot_gitconfig           # Git configuration
├── dot_tmux.conf           # tmux configuration
├── dot_zshrc               # interactive Zsh configuration
├── dot_zshenv              # Zsh environment
├── packages/               # package inventories + migration notes
├── machine/                # machine-specific system snapshots
│   ├── etc/
│   │   ├── keyd/
│   │   ├── legion_linux/
│   │   ├── modprobe.d/
│   │   ├── modules-load.d/
│   │   └── systemd/
│   └── README.md
└── README.md
```

### `dot_*` — the workstation layer

The chezmoi source contains the user configuration that defines the everyday environment:

- **Zsh / Git / tmux**
- **Ghostty / Starship / Fastfetch / Cava / Yazi**
- **Neovim**
- **Swappy and screenshot tooling**
- **Keyd user mappings**
- **Spotify / Spicetify configuration**
- **Caelestia / Hyprland personal overrides**

Not everything here is universally portable. Desktop overrides can encode assumptions about the current monitor layout, NVIDIA environment and Caelestia/Hyprland stack. Those are configuration worth preserving, but they should be **adapted**, not blindly replayed on a different system.

### `machine/` — the hardware boundary

System-level configuration is intentionally kept away from portable user dotfiles.

The snapshot includes configuration for:

- Legion power/profile behavior
- Legion audio/kernel quirks
- global Keyd configuration
- kernel module loading
- systemd services and timers
- logind
- Ollama as a local service

See **[`machine/README.md`](machine/README.md)** before using anything from this directory.

### `packages/` — environment inventory

```text
packages/
├── pacman-explicit.txt     # explicitly installed packages
├── aur.txt                 # foreign / AUR packages
└── README.md               # package + migration notes
```

These files describe the environment; they are intentionally not pretending to be a finished one-command installer.

---

## Design principles

### 01 — Configuration ≠ state

Things that describe how the workstation should behave belong here. Things created merely because the workstation has been used generally do not.

### 02 — Portable ≠ machine-specific

A shell alias and a hardware power profile have very different portability. They live behind an explicit boundary rather than being restored as one undifferentiated blob.

### 03 — Recovery before automation

A transparent, inspectable known-good snapshot is more useful to me than premature bootstrap automation. Automation can be built when a real migration provides the requirements.

### 04 — Git should explain the machine

The history is intended to show *why* configuration was captured and changed, not merely preserve the latest state.

---

## What is intentionally excluded?

This repository should **not** contain credentials or account/session state.

Examples deliberately kept outside the source:

- SSH/GPG private keys and API tokens
- browser profiles and cookies
- Spotify account/session state
- caches, histories and application databases
- `~/Programs/` and unrelated coding projects
- migration backups
- obsolete/unused configuration

The governing rule remains:

> **preserve configuration, not accidental state.**

---

## Migration model

```text
fresh OS / desktop
        │
        ▼
install required packages
        │
        ▼
restore portable user configuration
        │
        ▼
adapt desktop-specific configuration
        │
        ▼
apply machine-specific hardware configuration
        │
        ▼
selectively migrate application state
        │
        ▼
verify
```

The separation is intentional: a migration should not blindly recreate every workaround that accumulated on the previous installation.

## Using the source

If chezmoi is already configured, the source directory can be located without remembering its path:

```bash
chezmoi source-path
```

or entered directly with:

```bash
chezmoi cd
```

On my current setup the source follows chezmoi's standard source-directory layout under `~/.local/share/chezmoi`.

> [!CAUTION]
> This is a personal workstation configuration, not a drop-in distro configuration. Inspect and adapt files before applying them—especially anything under `machine/`.

---

## Status

**Captured**

- user configuration
- Caelestia / Hyprland personal configuration
- Legion machine-level snapshots
- pacman and AUR package inventories
- Git history

**Deliberately not solved yet**

- universal bootstrap/reinstall automation
- cross-machine portability for hardware-specific configuration
- wholesale application-state migration

That incompleteness is intentional: this repository records what is known to be worth preserving without claiming portability that has not been tested.

---

## Security

Credentials, private keys, browser/session state and application databases are not intended to be tracked.

If sensitive material is ever discovered in the repository, please report it privately rather than opening a public issue.

## License / reuse

This is personal configuration and some files are specific to my hardware and desktop stack. Feel free to study or adapt ideas, but **review everything before applying it to another system**.
