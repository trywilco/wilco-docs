---
title: Glossary
nav_order: 2
---
# Glossary

- **Step**: A task that usually represents a single user interaction.
- **Quest**: A series of connected steps that present a complete scenario for users to go through. A typical quest will have 2-5 steps.
- **Trigger**: A system event caused by the user. Examples: new chat message, PR opened, env var added to Heroku, etc.
- **Action**: A change in the user's state in reaction to a trigger. Examples: advance to next step, approve/reject user’s PR, send a message from bot, etc.
- **Conditions**: A way to check the user’s state. The state can be the text user entered in the chat, any piece of information attached to the trigger (e.g., PR Status), or information from a 3rd party service (e.g., env var value in Heroku)
- **FlowNode**: when a step starts or triggers are recognized, a Flow will begin. A single element in the flow is called FlowNode. A node is a combination of actions and conditions.
- **GitHub Actions**: command executed as part of GitHub workflow during PR checks.
