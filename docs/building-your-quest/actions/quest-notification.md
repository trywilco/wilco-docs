---
title: quest_notification
parent: Actions
grand_parent: Building Your Quest
nav_order: 15
---

# quest_notification

### Description

**Type**: Action

Notifies a user about an event that happened while playing through a quest.

## Params

- **title:** The title of the notification to be displayed. Limited to 28 characters. 
- **description**: The description to be displayed in a notification. Limited to 52 characters.
- **imageUrl**: The image to be displayed in the notification. Defaults to the "Hello World" image. 

## Result

A notification will show up to the user in Snack.

## Usage Example

```yaml
do:
- actionId: quest_notification
  params:
    title: "quest notification title"
    description: "quest notification description"
    imageUrl: "theImageURL"
```

In this example we make a quest notification which will notify about that event while the user is playing a quest .
## Relevant Triggers

All triggers