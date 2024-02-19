---
title: store_user_property
parent: Actions
grand_parent: Building Your Quest
---

# store_user_property

### Description

**Type**: Action

Save a value under the user, so you'll be able to use it later.

## Params

- **name:** The name of the property.
- **value:** The value of the property.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
  - actionId: store_user_property
    params:
      name: answer
      value: ${userMessageText}
```
In this example, we store the user's response under the `answer` key. Later, we can access this value using `${user.properties.answer}``.
These properties are shared across all of your quests. For example, you can ask for a user property in one quest and use it later in a different quest.

## Relevant Triggers

All triggers
