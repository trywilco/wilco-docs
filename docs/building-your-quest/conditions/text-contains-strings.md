---
title: text_contains_strings
parent: Conditions
grand_parent: Building Your Quest
---

# text_contains_strings

## Description

**Type**: Condition

Checks if text contains one of possible strings (not case-sensitive).

## Params

- **text:** The input string.
- **strings:** An array of items where each item is either a string or array of strings. If the item is an array of strings, all strings must be found in the text.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: text_contains_strings
    params:
      text: "${userMessageText}"
      strings:
      - mobile
      - ios
      - android
  then:
    ...
```

The `text_contains_strings` condition is used to verify that the text entered by the user in Snack means mobile/Mobie/ios/iOS/android.

If each string param is an array of strings, the condition will search for one of the string, so for example:
```yaml
      strings:
      - one
      - - two
        - three    
```
Will search for `"one" **and** ("two" **or** "three")`

## Relevant Triggers

All triggers
