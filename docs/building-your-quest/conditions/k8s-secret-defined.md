---
title: k8s_secret_defined
parent: Conditions
grand_parent: Building Your Quest
---

# k8s_secret_defined

Category: K8s
Description: Check if a secret is set (exists) for the K8s namespace.
Type: Condition

## Description

**Type**: Condition

Check if secret is set (exists) for the K8s namepsace. Returns true or false.

## Params

- **key:** The the secret name

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
