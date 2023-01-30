---
title: github_is_user_valid
parent: Conditions
grand_parent: Building Your Quest
---

# github_is_user_valid

## Description

**Type**: Condition

Checks if the username exists in Github.

## Params

- **githubUserName:** The Github username to be verified.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if: 
  conditions:
    - conditionId: user_check_authentication_exists
      name: user_authentication
      params: 
        authType: 'github'
    - conditionId: github_is_user_valid
      params:
        githubUserName: "${outputs.user_authentication.value.nickname}"
```

The `github_is_user_valid` condition uses the result of `user_check_authentication_exists` and checks if it is a valid Github username.

## Relevant Triggers

All triggers