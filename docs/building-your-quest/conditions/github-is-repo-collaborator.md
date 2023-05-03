---
title: github_is_repo_collaborator
description: Check if the user accepted the invitation for their repo when building your dev challenge (Quest Builder Conditions).
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_repo_collaborator

## Description

**Type**: Condition

Checks if the user accepted the invitation for their repo. 

## Params

No params required as conditions. The user's Github username and Github repo name are stored in  `user`.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_is_repo_collaborator
  then:
    ...
```

## Relevant Triggers

All triggers
