# Cargo Dist Explore

Test project for exploring cargo-dist release automation.

## Release Workflow

```mermaid
graph TD
    A[Developer pushes commit to main] --> B{Conventional commit?}
    B -->|Yes| C[Release - Prepare workflow triggers]
    B -->|No| D[No release actions]

    C --> E[Determine version bump type]
    E --> F[cargo set-version --bump]
    F --> G[git-cliff --tag vX.Y.Z]
    G -->|⚠️ Tag doesn't exist yet| H[git-cliff adds date suffix]
    H --> I[Create/update release branch]
    I --> J[Create/update Release PR]

    J --> K[Developer reviews Release PR]
    K --> L[Developer merges Release PR]

    L --> M[Release - Tag workflow triggers]
    M --> N[Create git tag vX.Y.Z-YYYY-MM-DD]

    N --> O[Release workflow triggers on tag]
    O --> P[cargo-dist plan]
    P --> Q[Build artifacts]
    Q --> R[Create GitHub release]
    R --> S[Upload artifacts & installers]

    style H fill:#ffcccc
    style N fill:#ffcccc
    style G fill:#fff2cc
```

### Current Issue

The workflow creates **date-suffixed release versions** (e.g., `v3.7.0-2025-09-28`) because:

1. **Step G**: `git-cliff --tag "vX.Y.Z"` is called with a tag that doesn't exist yet
2. **Step H**: git-cliff automatically appends the current date to make the tag unique
3. **Step N**: The tag gets created with the date suffix
4. **Steps O-S**: cargo-dist uses the date-suffixed tag for the release

The tag creation happens **after** the changelog generation, causing this timing issue.
