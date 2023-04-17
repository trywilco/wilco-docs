---
title: ready_message
parent: Actions
grand_parent: Building Your Quest
nav_order: 2
---

# ready_message

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

The action `ready_message` sends "ready"/"not ready" buttons to the user in order to confirm their readiness.

Here is how it will look like:
![Ready Message Component]


[Ready Message Component]: {% link assets/images/building-your-quest/ready-message.png %}

