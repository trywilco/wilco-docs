---
title: github_reply_to_discussion
parent: Actions
grand_parent: Building Your Quest
nav_order: 12
---

# github_reply_to_discussion

## Description

**Type**: Action

Reply to a GitHub discussion.

## Params

- **discussionNumber:** The discussion number. Can be used with the `github_discussion_created` trigger and the `${githubDiscussionNumber}` parameter.
- **body:** The branch name in the quest's start repository. 

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
trigger:
  type: github_discussion_created
  flowNode:
    do:
      - actionId: github_reply_to_discussion
        params:
          discussionNumber: "${githubDiscussionNumber}"
          body: "Message body"

```


## Relevant Triggers

`github_discussion_created`

[start repository]: {% link docs/building-your-quest/repository.md %}
