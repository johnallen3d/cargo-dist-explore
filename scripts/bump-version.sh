#!/bin/bash
set -euo pipefail

# Simple version bump script based on conventional commits
# Usage: ./bump-version.sh

# Get the latest tag
LATEST_TAG=$(git describe --tags --abbrev=0)
echo "Latest tag: $LATEST_TAG"

# Get commits since the latest tag
COMMITS=$(git log --oneline ${LATEST_TAG}..HEAD --grep="^feat" --grep="^fix" --grep="^docs" --grep="^style" --grep="^refactor" --grep="^perf" --grep="^test" --grep="^chore" --grep="^ci" --grep="^build" --grep="^revert")

if [ -z "$COMMITS" ]; then
    echo "No conventional commits found since $LATEST_TAG"
    exit 1
fi

echo "Commits since $LATEST_TAG:"
echo "$COMMITS"

# Determine bump type
BUMP_TYPE="patch"

# Check for breaking changes (BREAKING CHANGE or feat!)
if git log --oneline ${LATEST_TAG}..HEAD | grep -E "(BREAKING CHANGE|!:)" > /dev/null; then
    BUMP_TYPE="major"
    echo "Breaking changes detected -> major bump"
elif git log --oneline ${LATEST_TAG}..HEAD | grep -E "^[0-9a-f]+ feat" > /dev/null; then
    BUMP_TYPE="minor"
    echo "New features detected -> minor bump"
else
    echo "Only fixes/patches detected -> patch bump"
fi

echo "Bump type: $BUMP_TYPE"

# Perform the version bump
echo "Running: cargo set-version --workspace --bump $BUMP_TYPE"
cargo set-version --workspace --bump $BUMP_TYPE

# Get the new version
NEW_VERSION=$(grep '^version = ' Cargo.toml | head -1 | sed 's/version = "\(.*\)"/\1/')
echo "New version: $NEW_VERSION"

# Update changelog
echo "Updating changelog..."
git-cliff --tag "v$NEW_VERSION" -o CHANGELOG.md

# Commit changes
echo "Committing version bump..."
git add .
git commit -m "chore: bump version to $NEW_VERSION"

# Create tag
git tag "v$NEW_VERSION"

echo "Version bumped to v$NEW_VERSION"
echo "To push: git push origin main --tags"