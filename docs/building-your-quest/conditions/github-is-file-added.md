---
title: github_is_file_added
parent: Conditions
grand_parent: Building Your Quest
nav_order: 8
---

# github_is_file_added

## Description

**Type**: Condition

Checks if a specified files was added as part of a PR change.

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