---
title: k8s_backend_config_var_defined
parent: Conditions
grand_parent: Building Your Quest
nav_order: 12
---

# k8s_backend_config_var_defined

## Description

**Type**: Condition

Check if a config variable is set (exists) for the K8s backend app. If a config var exists, it is set on the condition's output.

## Params

- **key:** The config var key.

## Outputs

If a config var exists, its `value` is set by the condition's output.

It can be referenced by other blocks using `outputs.<condition_name>.value`

## Usage Example

```yaml
if:
  conditions:
  - conditionId: k8s_backend_config_var_defined
    name: new_relic_license_key_config
    params:
      key: NEW_RELIC_LICENSE_KEY
  then: 
    ...
```

The `k8s_backend_config_var_defined` condition is used to check that the user had set the `NEW_RELIC_LICENSE_KEY` config var.