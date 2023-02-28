---
title: network_http_load
parent: Actions
grand_parent: Building Your Quest
nav_order: 12
---

# network_http_load

Category: Network
Description: Generate HTTP traffic on a specified URL
Type: Action

### Description

**Type**: action

Run HTTP requests on a specific URL. This action is used to load a server with large number of requests in a short period of time.
The action uses [autocannon].

## Params

- **duration:** The number of seconds to run the autocannon. The maximal allowed duration is 1800 seconds (30 minutes)
- **connections**: The number of concurrent connections to use. The maximal number of allowed connections is 50.
- **url**: HTTP or HTTPS URL
- **requests:** A list of reqests to send

## Outputs

No additional info is added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: network_http_load
  params:
    url: ${user.K8sBackendUrl}
    connections: 5
    duration: 1200
    requests:
    - /api/items?limit=100&offset=0
    - /api/tags
    - /api/items/item-74-hn25x0
    - /api/items/item-74-hn25x0/comments
    - /api/profiles/user74
    - /api/items?seller=user74&limit=100&offset=0
```

In this example we run a list of requests on the user's Anythink backend server. The requests are sent using 5 concurrent connections for 1200 seconds.

## Relevant Triggers

All triggers

[autocannon]: https://github.com/mcollina/autocannon