---
title: is_user_message_text_ready_to_continue
parent: Conditions
grand_parent: Building Your Quest
nav_order: 4
---

# is_user_message_text_ready_to_continue

## Description

**Type**: Condition

In some cases the bots just want confirmation from the user that they are ready to continue. This condition verifies that the text means “ready”. Examples for relevant keywords are:

- ready
- done
- let’s go
- success

## Params

No params required. The condition uses `userMessageText` which is part of the payload sent along with the trigger when the user sends a message to the bot.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
  type: user_message
  params:
    person: Keen
  flowNode:
    if:
      conditions:
      - conditionId: is_user_message_text_ready_to_continue
      then:
        ...
```

The `is_user_message_text_ready_to_continue` condition is used to verify that the message sent by the user to `Keen` means he is ready to continue.

## Relevant Triggers

- `user_message`
