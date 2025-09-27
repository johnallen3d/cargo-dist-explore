# Cargo Dist + Release Please Integration

This repository uses an automated release system that combines **release-please** for release management with **cargo-dist** for building and publishing releases.

## How It Works

### 1. **Commit with Conventional Commits**
Use conventional commit messages to trigger automatic releases:

- `fix: description` → Patch version bump (0.1.0 → 0.1.1)
- `feat: description` → Minor version bump (0.1.0 → 0.2.0)  
- `feat!: description` or `BREAKING CHANGE:` → Major version bump (0.1.0 → 1.0.0)

### 2. **Release Please Creates PR**
After conventional commits are pushed to `main`:

- **release-please** analyzes commit history since last release
- Automatically creates/updates a "Release PR" with:
  - Version bump in all `Cargo.toml` files
  - Updated `CHANGELOG.md` with new entries
  - Clear diff showing exactly what will be released

### 3. **Team Review & Merge**
- Review the Release PR to validate the changelog and version bump
- Make any manual edits to the changelog if needed
- **Merge the Release PR** when ready to release

### 4. **Automatic Release**
Upon merge, release-please:
- Creates a git tag (e.g., `v0.4.0`)
- The tag triggers **cargo-dist** workflow
- cargo-dist builds binaries and creates GitHub Release
- GitHub Release includes formatted changelog content

## Repository Structure

```
├── .github/workflows/
│   ├── release-please.yml    # Creates/updates Release PRs
│   └── release.yml          # cargo-dist (builds & publishes)
├── cli/Cargo.toml           # CLI crate
├── web/Cargo.toml           # Web crate  
├── Cargo.toml               # Workspace config
├── CHANGELOG.md             # Auto-generated changelog
└── cliff.toml               # git-cliff config (used by cargo-dist)
```

## Development Workflow

1. **Make changes** using conventional commit messages
2. **Push to main** (or merge PR with conventional commits)
3. **Wait for Release PR** to be created automatically  
4. **Review & merge Release PR** when ready to release
5. **Automated release** happens immediately after merge

## Manual Release Override

To force a specific version:
```bash
git commit --allow-empty -m "chore: release 2.0.0" -m "Release-As: 2.0.0"
```

## Tools Integration

- **release-please**: PR-based release management + conventional commits
- **git-cliff**: Changelog formatting and categorization
- **cargo-edit**: Automatic version bumping in Cargo.toml files  
- **cargo-dist**: Binary building, GitHub releases, and distribution