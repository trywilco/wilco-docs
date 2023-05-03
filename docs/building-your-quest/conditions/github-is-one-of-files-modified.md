---
title: github_is_one_of_files_modified
description: Check if one of specified files was modified as part of a PR change when building your dev challenge (Quest Builder Conditions).
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_one_of_files_modified

## Description

**Type**: Condition

Checks if one of specified files was modified as part of a PR change.

## Params

- **fileNames:** files paths in the repository

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_is_one_of_files_modified
    params:
      fileNames:
      - backend/readme.md
      - frontend/readme.md
      - readme.md
  then:
    ...
```

The `github_is_one_of_files_modified` condition is used to check if one of the `readme.md` files in the repository was modified in the PR

## Relevant Triggers

- `github_pr_lifecycle_status`
