---
title: k8s_secret_defined
parent: Conditions
grand_parent: Building Your Quest
---

# k8s_secret_defined

## Description

**Type**: Condition

Checks if a secret is set (exists) for the K8s namepsace. Returns true or false.

## Params

- **key:** The secret name

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
    conditions:
    - conditionId: k8s_secret_defined
        params:
        secretName: new-relic-license-key
    then:
```

The `k8s_secret_defined` condition is used to check that users set the `new-relic-license-key` secret within their namespace.