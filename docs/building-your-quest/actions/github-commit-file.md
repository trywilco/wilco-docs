---
title: github_commit_file
parent: Actions
grand_parent: Building Your Quest
nav_order: 9
---

# github_commit_file

### Description

**Type**: Action

Commits a single file to the main branch of the user's repository.

## Params

- **file:** The file to commit (from the tests folder).
- **path:** Where to copy this file too in the user's repository.
- **message** The commit message to show.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
  - actionId: github_commit_file
    params:
      file: ${info.txt}
      path: "."
      message: "New file to commit"
```

In this example, we put the info file in the root directory

## Relevant Triggers

All triggers
