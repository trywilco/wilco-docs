---
title: network_find_selector
parent: Actions
grand_parent: Building Your Quest
nav_order: 13
---

# network_find_selector

Category: Network
Description: Evaluate `innerText` of an element matching a specified selector in a page
Type: Action

### Description

**Type**: action

Wait for a selector to appear in a apecified page, and if exists, evaluate the `innerText` property of the first element matching the selector

## Params

- **url:** The page's URL. It should include scheme, e.g. https://
- **selector**: A CSS selector to search for 
- **timeout**: Maximum time to wait for the selector to appear in milliseconds. Defaults to 30000 (30 seconds)

## Outputs

The action sets the `innerText` property of the first found element matching the selector in the `value` of its outputs.

This can be accessed by other actions and conditions using:

`${outputs.<action_name>.value}`

## Usage Example

```yaml
do:
- actionId: network_find_selector
  name: card_selector
    params:
      url: ${user.K8sFrontendUrl}
      selector: .card-title

if:
  conditions:
  - conditionId: is_falsy
    params:
      value: ${outputs.card_selector.value}

  then:
    - actionId: bot_message
      params:
        person: head-of-rd  
        messages:
         - text: Umm... I tried to access [frontend app](${user.K8sFrontendUrl}) but didn’t get a valid response.
```

In this example we test if the frontend loaded succesfully by checking for elements matching the selector `.card-title`

## Relevant Triggers

All triggers
