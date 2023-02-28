---
title: finish_step
parent: Actions
grand_parent: Building Your Quest
nav_order: 17
---

# finish_step

## Description

**Type**: Action

Advances the user to the next step in the current quest, or finishes the quest if this is the last step.

## Params

No params required.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: finish_step
```

An example from the `onboarding` quest can be found [here]

## Relevant Triggers

All triggers

[here]: https://github.com/trywilco/quest-docker-localsetup/blob/main/steps/setup_docker_accept_invite.yml
