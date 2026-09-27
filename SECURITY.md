# Security Policy

## Sensitive information

This repository is intended to contain configuration, not secrets or account/session state.

API tokens, passwords, private keys, browser cookies/profiles, authentication databases and similar credentials should never be committed.

If you discover sensitive material in this repository, **please do not open a public issue containing the value**. Contact the repository owner privately so the credential can be revoked and the history remediated where necessary.

## Configuration safety

Files under `machine/` can be specific to one machine, kernel, hardware configuration or desktop stack. Treat them as reference snapshots rather than universally safe defaults. Review changes before applying them to another system.
