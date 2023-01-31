---
title: array_find
parent: Conditions
grand_parent: Building Your Quest
nav_order: 19
---

# array_find

Category: Array
Description: Find an element in the array that matches specified conditions
Type: Condition

### Description

**Type**: action

Find an element in the array that matches specified conditions. An `item` property is available in the internal conditions to access the current item in the array. The condition returns `true` if such element exists and sets the first found element in its outputs

## Params

- **array:** array of elements
- **conditions:** list of conditions to apply to the array elements

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

In this example we perform an action that returns an array and name the action `action_result`. Then, we test if the result array has an elements that contains the string `newrelic.syslog.nr-data.net`.

## Relevant Triggers

All triggers
