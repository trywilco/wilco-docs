---
title: array_every
description: Test wheter all elements in an array pass the specified conditions when building your dev challenge (Quest Builder Conditions)
parent: Conditions
grand_parent: Building Your Quest
---

# array_every

### Description

**Type**: Condition

Tests whether all elements in an array pass the specified conditions. An `item` property is available as an internal condition to access the current item in the array.

## Params

- **array:** An array of elements.
- **conditions:** The list of conditions to apply to the array elements.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
conditions:
- conditionId: array_all
  params:
    array: ${outputs.get_users.value}
    conditions:
      - conditionId: text_match_regex
        params: 
          text: ${item.email}
          regex: @gmail.com$
then:
  ...
```

In this example, we use the result of an action called `get_users` and verify that all the users' emails use the `gmail.com` domain.

## Relevant Triggers

All triggers
