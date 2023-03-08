---
title: github_is_file_added_in_push
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_file_added_in_push

## Description

**Type**: Condition

Checks if a file was added in a push.

## Params

- **fileName:** The file path that to be checked.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_is_file_added_in_push
    params:
      fileName: readme.md
  then:
    ...
```

The `github_is_file_added_in_push` condition is used to check if the file `readme.md` was added to the repository in the user's branch

## Relevant Triggers

- `github_pr_lifecycle_status`