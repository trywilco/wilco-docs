---
title: k8s_backend_config_var_defined
parent: Conditions
grand_parent: Building Your Quest
---

# k8s_backend_config_var_defined

Category: K8s
Description: Check if a config variable is set (exists) for the K8s backend app.
Type: Condition

## Description

**Type**: Condition

Check if config variable is set (exists) for the K8s backend app. If config var exists, it is set on the condition outputs.

## Params

- **key:** The config var key

## Outputs

If a config var exists, its `value` is set on the conditions outputs.

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

The `k8s_backend_config_var_defined` condition is used to check that user set the `NEW_RELIC_LICENSE_KEY` config var.
