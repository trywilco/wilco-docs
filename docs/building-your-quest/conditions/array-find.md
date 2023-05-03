---
title: array_find
parent: Conditions
description: Find an element in an array that matches specified conditions when building your dev challenge (Quest Builder Conditions).
grand_parent: Building Your Quest
---

# array_find

### Description

**Type**: Condition

Finds an element in the array that matches specified conditions. An `item` property is available as an internal condition to access the current item in the array. The condition returns `true` if such an element exists and sets the first found element as its output.

## Params

- **array:** An array of elements.
- **conditions:** A list of conditions to apply to the array of elements.

## Outputs

The action sets the first found element in the `value` of its outputs.

This can be accessed by other actions and conditions using:

`${outputs.<condition_name>.value}`

## Usage Example

```yaml
do:
- actionId: some_action_that_returns_array
  name: action_result

conditions:
- conditionId: array_find
  name: array_find_result
  params:
    array: ${outputs.action_result.value}
    conditions:
      - conditionId: text_contains_strings
        params: 
          text: ${item.url}
          strings: 
            - newrelic.syslog.nr-data.net
then:
  ...
```

In this example we perform an action that returns an array and name the action `action_result`. Then we test if the resulting array has an element that contains the string `newrelic.syslog.nr-data.net`.

## Relevant Triggers

All triggers
