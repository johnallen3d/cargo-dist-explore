# Cargo Dist Explore

Test project for exploring cargo-dist release automation.

## Current Release Workflow

### Step-by-Step Flow

1. **Developer Action**: Push conventional commit to `main` branch
2. **Trigger Check**: Release - Prepare workflow checks for conventional commits
3. **Version Analysis**: Determine bump type (patch/minor/major) from commit messages
4. **Version Bump**: Run `cargo set-version --workspace --bump <type>`
5. **⚠️ Changelog Generation**: Run `git-cliff --tag "vX.Y.Z"` (tag doesn't exist yet!)
6. **⚠️ Date Suffix Added**: git-cliff appends current date → `vX.Y.Z-YYYY-MM-DD`
7. **Branch Creation**: Create/update `release/vX.Y.Z-YYYY-MM-DD` branch
8. **PR Creation**: Create Release PR with date-suffixed version
9. **Manual Review**: Developer reviews and merges Release PR
10. **Tag Creation**: Release - Tag workflow creates git tag `vX.Y.Z-YYYY-MM-DD`
11. **Release Trigger**: cargo-dist Release workflow triggers on the date-suffixed tag
12. **Artifact Build**: cargo-dist builds binaries and installers
13. **GitHub Release**: Create release with date-suffixed name and upload artifacts

### Current Problem

**Date-suffixed releases** (e.g., `v3.7.0-2025-09-28`) occur because:
- git-cliff is called with `--tag "vX.Y.Z"` before the tag exists
- git-cliff automatically adds date suffix to make the non-existent tag unique
- This date-suffixed version propagates through the entire release process

## Proposed Fix: Two-Phase Changelog Generation

### Modified Workflow

1. **Developer Action**: Push conventional commit to `main` branch
2. **Trigger Check**: Release - Prepare workflow checks for conventional commits  
3. **Version Analysis**: Determine bump type (patch/minor/major) from commit messages
4. **Version Bump**: Run `cargo set-version --workspace --bump <type>`
5. **✅ Initial Changelog**: Run `git-cliff -o CHANGELOG.md` (no tag specified)
6. **Branch Creation**: Create/update `release/vX.Y.Z` branch (clean version)
7. **PR Creation**: Create Release PR with clean version
8. **Manual Review**: Developer reviews and merges Release PR
9. **Tag Creation**: Release - Tag workflow creates git tag `vX.Y.Z` (clean version)
10. **✅ Final Changelog**: Regenerate changelog with `git-cliff --tag "vX.Y.Z"`
11. **Release Trigger**: cargo-dist Release workflow triggers on clean tag
12. **Artifact Build**: cargo-dist builds binaries and installers  
13. **GitHub Release**: Create release with clean version name

### Benefits of Proposed Fix

- **Clean versions**: No more date suffixes in release names
- **Proper timing**: Changelog generation happens when tags actually exist
- **Minimal disruption**: Keeps existing PR-based review process
- **Better UX**: Release names match semantic versions exactly
