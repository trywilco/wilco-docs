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
- **messages:** A list of messages, each contains `text` and `delay`. The latter is optional, and means the time it would take a real person to write this message. The message `Bot is typing…` will be presented in Snack during this time. If delay not specified, a value will be calculated according to the text length.
    
  [Text Formatting]

- **components** A list of message components, which allows you to add interactivity to your communication.

  [Message Components]
    

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
startFlow:
  do:
  - actionId: bot_message
    params:
      person: keen
      messages:
      - text: "![](https://media.giphy.com/media/l2QE93CiS1hR6WbK0/giphy.gif)"
        delay: 0
      - text: Hey again!
        delay: 1500
      - text: I know that things might feel a bit overwhelming when you start a new
          job.
        delay: 2500
      - text: "So, to help familiarize you with your new work environment, I was thinking
          that maybe you first should set it up."
        delay: 3000
      - text: Just **let me know once you’re ready** to start your first task!
        delay: 5000
```

The action `bot_message` is used to send instructions from the bot `keen` to the user.

## Relevant Triggers

All triggers

[Text Formatting]: {% link docs/building-your-quest/writing-quest-texts/text-formatting.md %}
[Message Components]: {% link docs/building-your-quest/writing-quest-texts/message-components.md %}