# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2025-09-28

### 🚀 Features

- [**breaking**] Remove release-please and implement monolithic versioning

## [cli-v0.5.0] - 2025-09-27

### 🚀 Features

- [**breaking**] Add release automation via release-please ([#1](https://github.com/johnallen3d/cargo-dist-explore/issues/1))

### 🐛 Bug Fixes

- Bootstrap release-please with current version manifest
- Simplify release-please config for workspace
- Use config files to prevent workspace member discovery
- Replace workspace version inheritance with explicit versions
- Configure release-please to target cli package instead of workspace root
- Update release-please workflow to support PAT fallback

### 🧪 Testing

- Temporarily exclude web package to isolate release-please issue

### ⚙️ Miscellaneous Tasks

- *(main)* Release cli 0.4.0 ([#2](https://github.com/johnallen3d/cargo-dist-explore/issues/2))
- *(main)* Release cli 0.5.0 ([#3](https://github.com/johnallen3d/cargo-dist-explore/issues/3))

## [0.3.1] - 2025-09-27

### 🐛 Bug Fixes

- More release automation

## [0.3.0] - 2025-09-27

### 🚀 Features

- Improved release functionality

## [0.2.0] - 2025-09-27

### 🚀 Features

- Add automatic version bumping based on conventional commits

### 🐛 Bug Fixes

- Generate changelog with proper version tag

## [0.1.12] - 2025-09-27

### 🚜 Refactor

- Simplify release script to properly use cargo-edit

## [0.1.11] - 2025-09-27

### 🐛 Bug Fixes

- Update changelog with proper v0.1.9 section

## [0.1.9] - 2025-09-27

### 🚀 Features

- Integrate git-cliff for automated changelog generation

## [0.1.8] - 2025-09-27

### 🐛 Bug Fixes

- Only release cli redux

## [0.1.7] - 2025-09-27

### 🐛 Bug Fixes

- Release only cli

## [0.1.6] - 2025-09-27

### 🚀 Features

- Only release cli

## [0.1.5] - 2025-09-27

### 🚀 Features

- Move to workspaces

## [0.1.1] - 2025-09-27

### 📚 Documentation

- Fix repo url

## [0.1.0] - 2025-09-27

### 🚀 Features

- Initial commit
- Add release workflow

