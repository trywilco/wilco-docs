---
title: github_open_issue
parent: Actions
grand_parent: Building Your Quest
nav_order: 10
---

# github_open_issue

### Description

**Type**: Action

Opens an issue in the user’s Github repository.

## Params

- **title:** The title of the issue.
- **body:** The body of the issue.

## Result

No additional info is added to the global payload outputs.

## Usage Example

```yaml
- actionId: github_open_issue
  params:
    title: "#INC-5312: Missing image"
    body: It seems that when creating a new product without an image, there are broken images showing up in the product catalog. Please fix this by replicating this bug locally with mock data. Take a screenshot of the fix and attach it to a PR when you close the bug. There's a placeholder image in the repo that you can use named `placeholder.png`.
```

In this example, we open a Github issue for the user

## Relevant Triggers

All triggers