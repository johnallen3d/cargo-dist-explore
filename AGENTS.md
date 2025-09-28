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
**Automated PR-Based Release Workflow (ACTIVE):**
1. Create feature branch and commit changes using conventional commit messages
2. Create PR to `main` branch - automation triggers when PR is merged
3. GitHub Actions automatically:
   - Analyzes commits since last tag
   - Determines bump type (patch/minor/major)
   - Updates workspace and package versions
   - Generates changelog with git-cliff
   - Creates Release PR for team review
4. Team reviews and merges Release PR
5. On merge, second workflow creates git tag
6. cargo-dist automatically:
   - Builds for x86_64-linux and aarch64-darwin
   - Creates GitHub release with changelog
   - Uploads shell installers

**Manual Fallback (DEPRECATED):**
- `./scripts/bump-version.sh` - Use only if automation fails

**Key Tools:**
- **cargo-set-version**: Workspace version management
- **git-cliff**: Changelog generation from conventional commits
- **cargo-dist**: Cross-platform builds and GitHub releases

## Migration History
**Recently migrated FROM:** release-please component-based versioning
**Currently using:** Custom script + cargo-set-version + git-cliff + cargo-dist

This provides simpler monolithic releases while maintaining professional changelog generation and cross-platform distribution.

## Workflow Files
- `.github/workflows/changelog-pr.yml` - Creates release PRs automatically
- `.github/workflows/release-on-merge.yml` - Creates tags when PRs merge (requires RELEASE_PAT)
- `.github/workflows/release.yml` - cargo-dist release automation

## Setup Requirements
**Repository Secrets:**
- `RELEASE_PR_TOKEN` - Personal Access Token with `repo` permissions (already configured)
  - Used by both changelog-pr.yml and release-on-merge.yml workflows
  - Default `GITHUB_TOKEN` cannot trigger subsequent workflows due to GitHub security restrictions
  - PAT enables tag creation to properly trigger cargo-dist releases

## Agent Guidelines
- **Branch Protection**: Main branch is protected - NEVER push directly to main, always use PRs
- **GitHub Flow**: Always create feature branches and PRs for changes
- **Version Bumping**: Use conventional commits - automation handles everything
- **Release PRs**: Review and merge release PRs created by automation
- **Changelog**: Never manually edit - regenerated from git history
- **Testing**: Run `cargo test` before merging release PRs
- **Distribution**: cargo-dist handles all platform builds and GitHub releases
- **Emergency**: Use `./scripts/bump-version.sh` only if automation fails
- **Token Setup**: Uses existing RELEASE_PR_TOKEN for tag-triggered releases