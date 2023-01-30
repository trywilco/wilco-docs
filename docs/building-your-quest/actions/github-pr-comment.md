---
title: github_pr_comment
parent: Actions
grand_parent: Building Your Quest
nav_order: 5
---

# github_pr_comment

Category: Github
Description: Add comment on a PR on behalf of one the bots.
Type: Action

## Description

**Type**: Action

Add comment on a PR on behalf of one the bots

## Params

- **person:** Name of the bot. e.g., `keen` or `lucca`
- **message:** The comment text
    
    [Text Formatting]
    

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:          
- actionId: github_pr_comment
  params:
    person: keen
    message: "On it, I'll review the changes right away."
```

The `github_pr_comment` action is used to add comment from `keen` letting user know that she will review the PR.

## Relevant Triggers

- `github_pr_lifecycle_status`

[Text Formatting]: {% link docs/building-your-quest/writing-quest-texts/text-formatting.md %}