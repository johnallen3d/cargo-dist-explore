# AGENTS.md

## Build/Test/Lint Commands
This is a Rust workspace project using cargo-dist for releases.

**Build Commands:**
- `cargo build` - Build all workspace members
- `cargo build --release` - Release build
- `cargo test` - Run all tests
- `cargo check` - Fast syntax/type checking

**Release Commands:**
- `./scripts/bump-version.sh` - Automated version bump based on conventional commits
- `cargo set-version --workspace --bump <patch|minor|major>` - Manual version bump
- `git-cliff --tag "vX.Y.Z" -o CHANGELOG.md` - Generate changelog

## Code Style Guidelines
- **Rust Edition**: 2024
- **Conventional Commits**: Required for automated releases
  - `feat:` for new features (minor bump)
  - `fix:` for bug fixes (patch bump) 
  - `feat!:` or `BREAKING CHANGE:` for breaking changes (major bump)
- **Workspace Structure**: Monolithic versioning - all packages share same version
- **Release Tags**: Use `v*` format (e.g., `v2.0.0`) for monolithic releases

## Repository Architecture
This is a **Rust workspace** with **monolithic versioning**:
- `cli/` - Command-line application (primary distributable)
- `web/` - Web application (excluded from distribution)
- Shared workspace version in root `Cargo.toml`
- Single release process for all components

## Release Process
**Automated Release Workflow:**
1. Commit changes using conventional commit messages
2. Run `./scripts/bump-version.sh` to:
   - Analyze commits since last tag
   - Determine bump type (patch/minor/major)
   - Update workspace and package versions
   - Generate changelog with git-cliff
   - Create git tag
3. Push with `git push origin main --tags`
4. GitHub Actions (cargo-dist) automatically:
   - Builds for x86_64-linux and aarch64-darwin
   - Creates GitHub release with changelog
   - Uploads shell installers

**Key Tools:**
- **cargo-set-version**: Workspace version management
- **git-cliff**: Changelog generation from conventional commits
- **cargo-dist**: Cross-platform builds and GitHub releases

## Migration History
**Recently migrated FROM:** release-please component-based versioning
**Currently using:** Custom script + cargo-set-version + git-cliff + cargo-dist

This provides simpler monolithic releases while maintaining professional changelog generation and cross-platform distribution.

## Agent Guidelines
- **Version Bumping**: Always use conventional commits and the bump script
- **Changelog**: Never manually edit - regenerated from git history
- **Releases**: Use the automated workflow; manual intervention rarely needed
- **Testing**: Run `cargo test` before releases
- **Distribution**: cargo-dist handles all platform builds and GitHub release creation