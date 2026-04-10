# Cephalopodic Homebrew Tap

This repository is the public Homebrew distribution surface for Cephalopodic
command-line tools.

Today it exists to publish the `cephi` formula that installs the Cephalopodic
CLI from prebuilt artifacts hosted in the public releases repository. It is not
the source repo for the CLI itself and it does not build binaries. Its product
role is simple: give macOS and Linux users a stable `brew install` path for the
current published CLI.

## Product Surface

- Tap name: `cephalopodic/tap`
- Current formula: `cephi`
- Artifact source: GitHub release assets from `cephalopodic/releases`
- Install path:

```bash
brew tap cephalopodic/tap
brew install cephi
```

Or one-shot:

```bash
brew install cephalopodic/tap/cephi
```

## Developer / Agent Notes

Treat [`Formula/cephi.rb`](/Users/ianzepp/github/cephalopodic/homebrew-tap-public/Formula/cephi.rb)
as the authoritative implementation in this repo.

When updating this repository:

- Change the formula only after the corresponding release assets already exist.
- Keep `version`, asset filenames, checksums, and release tag URLs aligned.
- Preserve the platform split for Apple Silicon macOS, Intel macOS, and Linux.
- Keep the formula test minimal and offline-safe.

This repo should stay small. Product behavior lives in the CLI repo; release
artifacts live in the releases repo; this repo only maps published artifacts
into the Homebrew ecosystem.
