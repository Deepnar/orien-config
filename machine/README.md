# Machine-specific configuration

This directory is a **system snapshot for the current Lenovo Legion machine**.

It is intentionally separate from the portable `dot_*` configuration.

## Contents

- `etc/legion_linux/` — Legion power/profile configuration
- `etc/keyd/` — system-level Keyd device mapping
- `etc/modprobe.d/` — hardware/kernel module quirks
- `etc/modules-load.d/` — required kernel modules
- `etc/systemd/` — machine-specific services, timers, and overrides
- `etc/systemd/logind.conf` — current logind configuration

## Important

Do **not** restore this directory wholesale onto another computer or blindly apply it after changing desktop distributions.

Some files depend on:

- Lenovo Legion hardware
- the current kernel and driver stack
- NVIDIA configuration
- installed service names and executable locations
- the current system's user/group/service layout

When migrating to another OS (for example, Omarchy), use these files as a reference and re-apply only the hardware behavior that is still required.

## Snapshot philosophy

The purpose of this directory is recoverability and documentation, not universal portability.

If a machine-specific workaround is no longer needed on a future installation, **do not recreate it merely because it exists here**.
