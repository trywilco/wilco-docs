---
title: github_pr_review
parent: Actions
grand_parent: Building Your Quest
nav_order: 6
---

# github_pr_review

## Description

**Type**: Action

Review the PR using AI based on the chat instructions.

## Params

- **messages:** (object) The messages to be sent to the user. The object should have the following:
  - **person:** (string, required) The name of the bot who is sending the message
  - **approved:** (string, not required) The chat message to be sent when the PR is approved, if not present it will use the response from the AI.
  - **rejected:** (string, not required) The chat message to be sent when the PR is rejected, if not present it will use the response from the AI.
- **solution:** (string, not required) The solution to the PR. This is used to compare the PR with the solution and decide if the PR is correct or not, if not used it will base the solution on the chat instructions. 

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
  - actionId: github_pr_review
    params:
      messages:
        person: lucca
        approved: "Nice work! Now you can merge it."
        rejected: "Are you sure you changed correctly the relevant file?"

```

The `github_pr_review` action is used to approve or reject the PR and let user know they should merge it. The message is sent on behalf of the bot `person`

## Relevant Triggers

- `github_pr_lifecycle_status`

[Text Formatting]: {% link docs/building-your-quest/writing-quest-texts/text-formatting.md %}
