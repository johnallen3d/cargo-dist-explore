# Changelog

All notable changes to this project will be documented in this file.

## [3.4.1] - 2025-09-28

### 🐛 Bug Fixes

- Rename automation plan to avoid cargo-dist confusion

## [3.4.0] - 2025-09-28

### 🚀 Features

- Configure cargo-dist to include changelog in release notes ([#23](https://github.com/johnallen3d/cargo-dist-explore/issues/23))

### ⚙️ Miscellaneous Tasks

- Release v3.4.0 ([#24](https://github.com/johnallen3d/cargo-dist-explore/issues/24))

## [3.3.0] - 2025-09-28

### 🚀 Features

- Add project description to README ([#20](https://github.com/johnallen3d/cargo-dist-explore/issues/20))

### 🐛 Bug Fixes

- Resolve version mismatch bug in release automation ([#19](https://github.com/johnallen3d/cargo-dist-explore/issues/19))
- Correct YAML indentation errors in workflow files ([#21](https://github.com/johnallen3d/cargo-dist-explore/issues/21))

### ⚙️ Miscellaneous Tasks

- Release v3.3.0 ([#22](https://github.com/johnallen3d/cargo-dist-explore/issues/22))

## [3.2.2] - 2025-09-28

### 🚀 Features

- Update cli output ([#18](https://github.com/johnallen3d/cargo-dist-explore/issues/18))

### ⚙️ Miscellaneous Tasks

- Re-init cargo-dist
- Release v3.2.2 ([#17](https://github.com/johnallen3d/cargo-dist-explore/issues/17))

## [3.2.1] - 2025-09-28

### 🐛 Bug Fixes

- Complete release automation by using existing RELEASE_PR_TOKEN

### ⚙️ Miscellaneous Tasks

- Release v3.2.1 ([#16](https://github.com/johnallen3d/cargo-dist-explore/issues/16))

## [3.2.0] - 2025-09-28

### 🚀 Features

- Add release flow documentation

### ⚙️ Miscellaneous Tasks

- Release v3.2.0 ([#15](https://github.com/johnallen3d/cargo-dist-explore/issues/15))

## [3.1.1] - 2025-09-28

### 🐛 Bug Fixes

- Update release workflow tag pattern to match v-prefixed tags
- Add --allow-dirty flag to cargo-dist workflow
- Resolve git checkout conflicts in changelog PR workflow
- Simplify branch handling to avoid merge conflicts
- Correct PR search query to find existing release PRs

### ⚙️ Miscellaneous Tasks

- Release v3.1.1 ([#14](https://github.com/johnallen3d/cargo-dist-explore/issues/14))

## [3.1.0] - 2025-09-28

### 🚀 Features

- Remove config command ([#12](https://github.com/johnallen3d/cargo-dist-explore/issues/12))

### ⚙️ Miscellaneous Tasks

- Release v3.1.0 ([#13](https://github.com/johnallen3d/cargo-dist-explore/issues/13))

## [3.0.0] - 2025-09-28

### 🚀 Features

- [**breaking**] Change cli args ([#10](https://github.com/johnallen3d/cargo-dist-explore/issues/10))
- Add config command to show configuration directory

### 🐛 Bug Fixes

- Include Cargo.lock in release PR commits and update cargo-dist config
- Use RELEASE_PR_TOKEN for PR creation and GitHub CLI operations
- Minor formatting ([#9](https://github.com/johnallen3d/cargo-dist-explore/issues/9))
- Add cargo bin directory to PATH for cargo-binstall
- Simplify tool installation with direct GitHub releases
- Use only pre-built binaries for fast tool installation
- Use cargo-quickinstall script for cargo-edit installation

### 📚 Documentation

- Add test header to README

### ⚡ Performance

- Optimize tool installation with cargo-binstall

### ⚙️ Miscellaneous Tasks

- Release v3.0.0 ([#11](https://github.com/johnallen3d/cargo-dist-explore/issues/11))

## [2.2.0] - 2025-09-28

### 🚀 Features

- Add --version command line option ([#7](https://github.com/johnallen3d/cargo-dist-explore/issues/7))
- Add --help command line option

### 🐛 Bug Fixes

- Update release workflow tag pattern to support v-prefixed tags
- Correct cargo-edit installation check in workflow
- Use --force flag for cargo install to handle caching conflicts
- Update release workflow tag pattern for cargo-dist compatibility

### ⚙️ Miscellaneous Tasks

- Release v2.1.0 ([#6](https://github.com/johnallen3d/cargo-dist-explore/issues/6))
- Release v2.2.0 ([#8](https://github.com/johnallen3d/cargo-dist-explore/issues/8))

## [2.1.0] - 2025-09-28

### 🚀 Features

- Implement automated changelog and release PR system

### 🐛 Bug Fixes

- Tagging syntax ([#4](https://github.com/johnallen3d/cargo-dist-explore/issues/4))

### 📚 Documentation

- Update AGENTS.md with new PR-based release workflow

### ⚙️ Miscellaneous Tasks

- Release v2.1.0 ([#5](https://github.com/johnallen3d/cargo-dist-explore/issues/5))

## [2.0.0] - 2025-09-28

### 🚀 Features

- [**breaking**] Remove release-please and implement monolithic versioning

### ⚙️ Miscellaneous Tasks

- Bump version to 2.0.0

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

