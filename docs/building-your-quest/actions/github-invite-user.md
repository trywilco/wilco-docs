---
title: github_invite_user
parent: Actions
grand_parent: Building Your Quest
nav_order: 4
---

# github_invite_user

## Description

**Type**: Action

Invites user to collaborate on Github repo.

## Params

- **githubUserName:** The user’s Github username.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: github_invite_user
  params:
    githubUserName: "${outputs.user_authentication.value.nickname}"
```

The `github_invite_user` action is used to invite user to collaborate on the Github repo created for them. `githubUserName` param in this example is set from the result of previous condition named `user_authentication`. See below for the full YAML example.

## Relevant Triggers

All triggers