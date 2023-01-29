---
title: Glossary
nav_order: 2
---
# Glossary

- **Step**: A task that usually represents a single user interaction.
- **Quest**: A series of connected steps that represent a complete scenario for users to go through. A typical quest will have 2-5 steps.
- **Trigger**: A system event caused by the user. Examples: new chat message, PR opened, form submitted, etc.
- **Action**: A change in the user's state in reaction to a trigger. Examples: advancing to the next step, approving/rejecting the user’s PR, sending a message from the bot, etc.
- **Conditions**: A way to check the user’s state. The state can be the text a user entered in the chat, any piece of information attached to the trigger (e.g., PR Status), or information from a 3rd party service (e.g., env var value in K8s)
- **FlowNode**: When a step starts or triggers are recognized, a Flow will begin. A single element in the Flow is called FlowNode. A FlowNode is a combination of actions and conditions.
- **GitHub Actions**: Commands executed as part of the GitHub workflow during PR checks.