---
title: github_repo_api
parent: Actions
grand_parent: Building Your Quest
nav_order: 12
---

# github_repo_api

## Description

**Type**: Action

A generic action to make a request to the GitHub repository API.

## Params

- **method:** The HTTP method to use. Can be one of `get`, `post`, `patch`, `put`.
- **body:** The body of the request.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
    - actionId: github_repo_api
      params:
        method: patch
        path: /
        body:
          has_discussions: true
```


## Relevant Triggers

All triggers.

[start repository]: {% link docs/building-your-quest/repository.md %}
