---
title: github_add_secret
parent: Actions
grand_parent: Building Your Quest
nav_order: 13
---

# github_add_secret

### Description

**Type**: Action

Adds a secret to the user's repository.

## Params

- **secretName:** The name of the secret to add.
- **secretValue:** The value of the secret.
- **secretType** The type of secret to add. Can be one of `actions` or `codespaces`

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
  - actionId: github_add_secret
    params:
      secretName: "NEW_SECRET"
      secretValue: "secret value"
      secretType: actions
```

In this example, we add a new actions secret to the user's repository. 

## Relevant Triggers

All triggers
