---
title: github_is_file_modified
parent: Conditions
grand_parent: Building Your Quest
nav_order: 6
---

# github_is_file_modified

## Description

**Type**: Condition

Checks if a specified file was modified as part of a PR change

## Params

- **fileName:** The file path in the repository.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_is_file_modified
    paramsFramework:
      node:
        fileName: backend/app.js
  then:
    ...
```

The `github_is_file_modified` condition is used to check if the file `backend/app.js` was modified for `Node` backend. For other frameworks, the condition will return `true`.

## Relevant Triggers

- `github_pr_lifecycle_status`