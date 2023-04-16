---
title: bot_message
parent: Actions
grand_parent: Building Your Quest
nav_order: 2
---

# bot_message

## Description

**Type**: Action

Sends a message to the user on behalf of one of the bots. 

## Params

- **person:** The name of the bot. e.g., `keen` or `lucca`.    

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
startFlow:
  do:
  - actionId: ready_message
    params:
      person: keen
```

The action `ready_message` is used to send "ready"/"not ready" button when you want to get the readiness confirmation from the usre.

Here is how it will look like:
![Ready Message Component]


[Ready Message Component]: {% link assets/images/building-your-quest/ready-message.png %}

