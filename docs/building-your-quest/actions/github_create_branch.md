---
title: github_create_branch
parent: Actions
grand_parent: Building Your Quest
nav_order: 12
---

# github_create_branch

## Description

**Type**: Action

Create a new branch on the user's repo. The new branch is created using a branch in the quest's [start repository] and using the same rules.

## Params

- **branchName:** The new branch name.
- **startRepositoryBranchName:** Branch name in the quest's start repository. 
- **message:** The commit message to show on adding changes to new branch

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: github_create_branch
params:
    branchName: 'fix/app-crashes-on-load'
    startRepositoryBranchName: 'steps/app-crahes-on-load-step'
    message: 'Fix crash that happens when app loads'
```

The `github_create_branch` action is used to create a new branch called `fix/app-crashes-on-load` on the user's repo. The branch will be created using files found in the branch `steps/app-crahes-on-load-step` in the quest's start repository.

## Relevant Triggers

All triggers

[start repository]: {% link docs/building-your-quest/repository.md %}