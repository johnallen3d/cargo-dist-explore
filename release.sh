#!/bin/bash
set -e

# Get current version
CURRENT_VERSION=$(grep -E '^\s*version\s*=' Cargo.toml | head -1 | sed 's/.*"\(.*\)".*/\1/')
echo "Current version: $CURRENT_VERSION"

# Use git-cliff to determine the next version based on conventional commits
echo "Analyzing commits to determine version bump..."
BUMP_OUTPUT=$(git-cliff --bumped-version -v 2>&1)
SUGGESTED_VERSION=$(echo "$BUMP_OUTPUT" | grep "Bumping the version to" | sed 's/.*Bumping the version to //' | tr -d ' ')

if [ -z "$SUGGESTED_VERSION" ]; then
    echo "No version bump needed (no conventional commits since last release)"
    exit 0
fi

# Remove 'v' prefix if present
NEW_VERSION=${SUGGESTED_VERSION#v}
echo "Conventional commits suggest: $NEW_VERSION"

# Use cargo-edit to set the specific version
echo "Setting version to $NEW_VERSION..."
cargo set-version $NEW_VERSION

# Generate changelog with the new version tag
echo "Generating changelog..."
git-cliff --tag "v$NEW_VERSION" --output CHANGELOG.md

# Stage changes
git add Cargo.toml cli/Cargo.toml web/Cargo.toml Cargo.lock CHANGELOG.md

# Commit changes
git commit -m "chore(release): prepare for v$NEW_VERSION"

# Create tag
git tag "v$NEW_VERSION" -m "v$NEW_VERSION"

git push origin main && git push origin "v$NEW_VERSION"
