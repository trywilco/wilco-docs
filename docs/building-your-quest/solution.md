---
title: Step Solution
parent: Building Your Quest
---

# Step Solution

Sometimes a player might be stuck in a step for a while, not knowing how to continue. In this case, they have the ability to ask for a solution for that step. 

A solution is a flow node similar to the start quest flow node, which allows the creator to assist the user in any way they see fit. This can be by sending them a text message with clear instructions, or even triggering actions on their codebase. 

## Usage Example
```
  solution: 
  do:
    - actionId: bot_message
      params:
        person: lucca
        messages: 
          - text: Here's what you need to do in order to complete this step
          ...
```

{: .note }
You can omit the `person` parameter from the `bot_message` action, and the message will be sent from the bot the user has required the solution from
