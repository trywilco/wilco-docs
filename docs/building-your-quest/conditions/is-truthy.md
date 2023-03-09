---
title: is_truthy
parent: Conditions
grand_parent: Building Your Quest
---

# is_truthy

### Description

**Type**: Condition

Tests if a given expression is true in a boolean context. Truthy expressions are expressions that not evaluates to `false`,  `null`, or `undefined`. Strings that are equal to one of those are also considered non truthy. 

## Params

- **value:** The expression to be checked for truthiness.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: network_http_request
  name: call_backend
  params:
    url: "${user.K8sBackendUrl}/api/items?limit=10"
if:
  conditions:
  - conditionId: is_truthy
    params:
      value: ${outputs.call_backend.data?.items}
```

In this example, first we do a http request, and then check if the result is truthy. If the result is indeed truthy it means that the request was successful.

## Relevant Triggers

All triggers