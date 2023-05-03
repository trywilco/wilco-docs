---
title: github_is_file_added
description: Check if specified files were added as part of a PR change when building your dev challenge (Quest Builder Conditions).
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_file_added

## Description

**Type**: Condition

Checks if specified files were added as part of a PR change.

## Params

- **fileName:** The file path in the repository.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_is_file_added
    paramsFramework:
      node:
        fileName: backend/package-lock.json
  then:
    ...
```

The `github_is_file_added` condition is used to check if the file `backend/package-lock.json` was added for `Node` backend. For other frameworks, the condition will return `false`.

## Relevant Triggers

- `github_pr_lifecycle_status`
