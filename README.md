# orien-config

> Personal Linux configuration, machine notes, and recovery snapshot.

A private configuration repository for my CachyOS-based Hyprland setup.

This repo is intentionally split between **portable user configuration** and
**machine-specific configuration** so that personal preferences can travel
between installs without pretending that hardware-specific quirks are portable.

---

## ✦ What this contains

```text
orien-config/
├── dot_config/               # User-level application & desktop configuration
├── dot_local/                # Personal scripts and executables
├── dot_gitconfig             # Git identity and defaults
├── dot_zshrc                 # Zsh configuration
├── dot_zshenv                # Zsh environment
├── machine/                  # Hardware / system-specific configuration
└── packages/                 # Current package inventory
User configuration

The dot_config/ tree contains the parts of the desktop that are meant to
follow me across installations:

Hyprland / Caelestia personal overrides
Ghostty
Zsh ecosystem
Neovim
Yazi
Starship
Fastfetch
Cava
Keyd user mappings
Swappy
Spotify / Spicetify configuration
Personal screenshot utilities
Machine configuration

machine/ contains configuration tied to this particular laptop rather than
generic dotfiles:

Lenovo Legion power / profile configuration
Legion audio kernel quirk
Keyd global device mapping
Kernel module loading
systemd services and timers
machine-specific logind behavior
Ollama system service configuration

These files are preserved as a machine snapshot. They are not assumed to
be appropriate for another computer.

Package inventory

packages/ records what is explicitly installed on the current system:

pacman-explicit.txt — explicitly installed packages
aur.txt — foreign / AUR packages

This is an inventory, not yet an automated bootstrap script.

◇ Design principles
Portable ≠ universal

A setting belongs here because it is part of my environment, not because it
is universally useful.

Hardware-specific configuration stays under machine/.

State is captured before automation

This repository first captures a known-good system.

Automation and full rebuild scripts can be added later when there is an
actual need to rebuild or migrate the machine.

Don't copy application state blindly

Large application profiles, credentials, browser sessions, caches, and other
runtime state are deliberately kept out of the repository.

For example, the Zen browser profile is not currently migrated wholesale.
That is a separate, intentional task.

Keep the working system boring

The goal is not to continuously redesign the desktop.

The goal is to have a clean, recoverable snapshot that can be trusted when a
reinstall or migration eventually happens.

◎ Current state

This repository currently represents a known-good working system snapshot.

Captured:

portable dotfiles
machine-specific configuration
package inventories
Git history
private GitHub backup

Intentionally deferred:

full bootstrap / reinstall automation
Zen browser migration
further cosmetic experimentation

Those can be added when they become useful rather than maintained for their
own sake.

◌ Tooling

The user configuration is managed with
chezmoi.

The repository itself is a normal Git repository and is hosted privately on
GitHub.

Current remote:

Deepnar/orien-config
Git history

The repository is built in layers rather than as one giant initial dump:

Initial chezmoi snapshot
        ↓
Add machine-specific configuration
        ↓
future migration / automation work

This makes it easier to understand what changed and, more importantly, why.

License

This repository is personal configuration.

Use or adapt anything here at your own risk; some files are specific to my
hardware and environment.
