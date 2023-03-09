---
title: User
parent: Quest Resources
grand_parent: Building Your Quest
nav_order: 3
---

# user

## Description

**Type**: Quest Resources

Used to modify user configuration.

This resource allows the information stored in user to be modified. This is required when a quest needs info to exist or be removed when a user starts playing.

Supported properties:

- **clear:** Allows clearing specific information from the user.
    - attribute: A list of attributes to remove.

```yaml
resources:
- name: user
  clear:
    attribute:
    - newrelic
```

This example will remove `newrelic` information stored on the user.
