---
title: heroku_check_frontend_config_var
parent: Conditions
grand_parent: Quest Configuration
---

# heroku_check_frontend_config_var

Category: Heroku
Description: Check if config variable is set (exists) for the frontend Heroku app.
Type: Condition

## Description

**Type**: Condition

Check if config variable is set (exists) for the frontend Heroku app. If config var exists, it is set on the condition outputs.

## Params

- **key:** The config var key

## Outputs

In config var exists, its `value` is set on the conditions outputs.

It can be referenced by other blocks using `outputs.<condition_name>.value`

## Usage Example

```yaml
if:
  conditions:
  - conditionId: heroku_check_frontend_config_var
    name: project_path_config
    params:
      key: PROJECT_PATH
  then: 
    ...
```

The `heroku_check_frontend_config_var` condition is used to check that user set the PROJECT_PATH config var.

## Relevant Triggers

- `heroku_release_created`
