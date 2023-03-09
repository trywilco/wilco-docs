---
title: github_merge_pr
parent: Actions
grand_parent: Building Your Quest
nav_order: 9
---

# github_merge_pr

## Description

**Type**: Action

Merge a previously opened PR on the user's repository. The action finds the PR according to the head and base branches.

## Params

- **headBranch:** The PR head branch.
- **baseBranch:** The PR base branch.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: github_merge_pr
  params:
    headBranch: 'fix/app-crashes-on-load'
    baseBranch: 'main'
```

The `github_merge_pr` action is used to merge a PR previously opened on the user's repo, from a branch called `fix/app-crashes-on-load` to the `main` branch. 

## Relevant Triggers

All triggers
