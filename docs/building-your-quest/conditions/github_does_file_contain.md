---
title: github_does_file_contain
parent: Conditions
grand_parent: Building Your Quest
---

# github_does_file_contain

## Description

**Type**: Condition

Checks if the file added in a PR contains text that matches a given regex.

## Params

- **fileName:** The file path in the repository.
- **regex:** The regex string. The value is used as input to for the `RegExp` constructor.

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
if:
  conditions:
  - conditionId: github_does_file_contain
    params:
      regex: license_key
    paramsFramework:
      node:
        fileName: backend/newrelic.js
      rails:
        fileName: backend/config/newrelic.yml
      python:
        fileName: backend/newrelic.ini
  then:
    ...
```

The `github_does_file_contain` condition is used to check if the `newrelic` file contains the string `license_key`.

## Relevant Triggers

- `github_pr_lifecycle_status`