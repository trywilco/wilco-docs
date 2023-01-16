---
title: Actions
has_children: true
parent: Building Your Quest
nav_order: 4
has_toc: false 
---

# Actions 

This page explains how actions work and all supported actions are documented. This document assumes the reader is familiar with how [Triggers and Payloads] work.

## Actions - General

Actions are part of `do` statements and can be used to change the state of the user, provide them with information or offer guidance. Some actions also add information to the payload `outputs` to be used by other conditions or actions. A common example for this is communicating `success` and `error` . 

If `name` is set for the action, `outputs.<action_name>.success` will always be set and will default to `true` unless the action changed it.

Actions support the following params:

| Name            | Type   | Mandatory | Default | Description                                                                                                                                                                    |
|-----------------|--------|-----------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| actionId        | String | YES       | -       | String representing the actions. See section below for supported actions ids.                                                                                                  |
| name            | String | NO        | null    | Name is mandatory in order to use action outputs. If name is specified and action enriches payload outputs, it can be accessed using `${outputs.<action_name>.<param_name>}` . |
| params          | Map    | NO        | null    | Each action specifies which parameters it requires. Some parameters are passed transparently from the trigger payload and some must be configured.                             |
| paramsFramework | Map    | NO        | null    | Used in cases framework selected by the user affects the parameterss passed to the action. It is a map from the framework name to the parameters.                              |

Example:

```yaml
do:
- actionId: bot_message
  params:
    person: lucca
    messages:
    - text: "Great! Next, it might be a good idea to go ahead and **clone that repository**, before doing any other tasks. *Clone it*, don't fork it!"
      delay: 3000
    - text: "\"It might be\" as in - you should definitely do it **before doing any of your next tasks**."
      delay: 2000
    - text: "When you're done, *talk to ${bots['keen'].displayName}*, she’ll take it from here."
      delay: 2500
- actionId: finish_step
```

In this simple example two actions are performed. The first sends messages from a bot to the user and the second progresses the user to the next step.

Another example:

```yaml
- actionId: newrelic_configure_with_key
  name: newrelic_configure_with_key
  params:
    newRelicKey: "${userMessageText}" #userMessageText is text sent to a bot by the user 
```

In this example, the action `newrelic_configure_with_key` might fail with several error types. A name is set in order to fetch the error type:

```yaml
switch:
  key: "${outputs.newrelic_configure_with_key.error}"
  cases:
    invalid_key_format:
      do:
      ...
    invalid_key:
      do:
      ...
```

## Supported Actions

| Name                                     | Category  | Description                                                                       |
| ---------------------------------------- | --------- | --------------------------------------------------------------------------------- |
| [bot_message]                            | Chat      | Send message from user to a bot                                                   |
| [github_create_repo]                     | GitHub    | Create new repo for the user.                                                     |
| [github_invite_user]                     | GitHub    | Invite user to collaborate on a Github repo.                                      |
| [github_pr_comment]                      | GitHub    | Add comment on a PR on behalf of one the bots.                                    |
| [github_pr_approve]                      | GitHub    | Approve the PR and add a comment on behalf of a bot.                              |
| [github_pr_reject]                       | GitHub    | Reject the PR and add a comment on behalf of a bot.                               |
| [github_open_issue]                      | GitHub    | Opens an issue in the user’s Github repository                                    |
| [github_commit_file]                     | GitHub    | Fommit a file to the user's repository                                            |
| [newrelic_configure_with_key]            | New Relic | Configure user New Relic properties using given license key                       |
| [network_http_request]                   | Network   | Perform an http request                                                           |
| [finish_step]                            | Quest     | Advance the user to next step or finish quest in case this is the last step       |
| [quest_notification]                     | Quest     | Notify a user about an event that happened while in a quest.                      |


{: .note }
We look forward to adding new actions in the future. Please reach out to us at [Creators@wilcohq.com](creators@wilcohq.com) with any questions.

[bot_message]: {% link docs/building-your-quest/actions/bot-message.md %}
[github_create_repo]: {% link docs/building-your-quest/actions/github-create-repo.md %}
[github_invite_user]: {% link docs/building-your-quest/actions/github-invite-user.md %}
[github_pr_comment]: {% link docs/building-your-quest/actions/github-pr-comment.md %}
[github_pr_approve]: {% link docs/building-your-quest/actions/github-pr-approve.md %}
[github_pr_reject]: {% link docs/building-your-quest/actions/github-pr-reject.md %}
[github_open_issue]: {% link docs/building-your-quest/actions/github-open-issue.md %}
[github_commit_file]: {% link docs/building-your-quest/actions/github-commit-file.md %}
[newrelic_configure_with_key]: {% link docs/building-your-quest/actions/newrelic-configure-with-key.md %}
[network_http_request]: {% link docs/building-your-quest/actions/network-http-request.md %}
[finish_step]: {% link docs/building-your-quest/actions/finish-step.md %}
[quest_notification]: {% link docs/building-your-quest/actions/quest-notification.md %}
[Triggers and Payloads]: {% link docs/building-your-quest/triggers-and-payloads.md %}

