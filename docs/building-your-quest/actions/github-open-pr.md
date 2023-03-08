---
title: github_open_pr
parent: Actions
grand_parent: Building Your Quest
nav_order: 8
---

# github_open_pr

## Description

**Type**: Action

Open a new PR on the user's repository. 

## Params

- **headBranch:** The PR head branch
- **baseBranch:** The PR base branch
- **title:** PR title
- **body:** PR body

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: github_open_pr
  params:
    headBranch: 'fix/app-crashes-on-load'
    baseBranch: 'main'
    title: 'fix: app crashes on load'
    body: 'An update to the mongodb package caused app to crash. This PR fixes ths issue.'
```

The `github_open_pr` action is used to create a new PR from the branch `fix/app-crashes-on-load` to the `main` branch. The actions specifies the title and the body of the PR.

## Relevant Triggers

All triggers

[start repository]: {% link docs/building-your-quest/repository.md %}