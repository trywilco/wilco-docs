---
title: store_user_propery
parent: Actions
grand_parent: Building Your Quest
---

# store_user_propery

### Description

**Type**: Action

Save a value under the user, so you'll able to use it later

## Params

- **name:** The name of the property.
- **value:** The value of the property.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
  - actionId: store_user_propery
    params:
      name: answer
      value: ${userMessageText}
```
In this example we store the user response under the `answer` key, then later we can access this value using: `${user.properties.answer}`
Those propse are shared between any of your quests, so for example you can ask user property in one quest and use it later in different quest.

## Relevant Triggers

All triggers
