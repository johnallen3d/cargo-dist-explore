#!/bin/bash
set -e

echo "Select version bump type:"
echo "1) patch (x.y.Z)"
echo "2) minor (x.Y.0)"  
echo "3) major (X.0.0)"
read -p "Enter choice [1-3]: " choice

case $choice in
    1) BUMP_TYPE="patch" ;;
    2) BUMP_TYPE="minor" ;;
    3) BUMP_TYPE="major" ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

# Use cargo-edit to bump version
echo "Bumping $BUMP_TYPE version with cargo-edit..."
cargo set-version --bump $BUMP_TYPE

# Get the new version after bump
NEW_VERSION=$(grep -E '^\s*version\s*=' Cargo.toml | head -1 | sed 's/.*"\(.*\)".*/\1/')
echo "New version: $NEW_VERSION"

# Generate changelog
echo "Generating changelog..."
git-cliff --output CHANGELOG.md

# Stage changes
git add Cargo.toml cli/Cargo.toml web/Cargo.toml Cargo.lock CHANGELOG.md

# Commit changes
git commit -m "chore(release): prepare for v$NEW_VERSION"

# Create tag
git tag "v$NEW_VERSION"

echo "Release prepared! Push with:"
echo "  git push origin main && git push origin v$NEW_VERSION"