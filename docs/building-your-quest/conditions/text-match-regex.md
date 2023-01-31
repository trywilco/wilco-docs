---
title: text_match_regex
parent: Conditions
grand_parent: Building Your Quest
nav_order: 3
---

# text_match_regex

Category: String
Description: Check if text matches regex.
Type: Condition

## Description

**Type**: condition

Check if text matches a regex

## Params

- **text:** Input string
- **regex:** Regex string. Value is used as input to `RegExp` constructor
- **flags:** Input string. Flags to provide to the `RegExp` constructor

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
trigger:
  type: local_page_load
  flowNode:
    if:
      conditions:
      - conditionId: text_match_regex
        params:
          text: "${path}"
          regex: "^/@"
      then:
        ...
```

The `text_match_regex` condition is used to verify that `path` param found in the payload of the trigger `local_page_load` matches the regex `^/@`

Flags can be provided by using the `flags` param. The following condition looks for either `done` or `complete` in a user's message, ignoring case.

```yaml
trigger:
  type: user_message
  params:
    person: keen
  flowNode:
    if:
      conditions:
      - conditionId: text_match_regex
        params:
          text: "${userMessageText}"
          regex: done|complete
          flags: i
      then:
        ...
```

## Relevant Triggers

All triggers
