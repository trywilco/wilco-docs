---
title: github_is_file_added_in_push
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_file_added_in_push

Category: Github
Description: Check if a file was added in the head commit of a git push (not specific to a PR)
Type: Condition

## Description

**Type**: Condition

Check if a file was added in a push


## Params

- **fileName:** file path that we want to check

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

The `github_is_file_added_in_push` condition is used to check if the file `reamde.md` was added to the repository in the user's branch

## Relevant Triggers

- `github_pr_lifecycle_status`
