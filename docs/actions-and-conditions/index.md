---
title: Actions and Conditions
has_children: true
has_toc: false
---

# Actions and Conditions

This page explains how actions and conditions work and documents all actions and conditions supported. This document assumes the reader is familiar with how [Triggers and Payload] work.

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
switch:key: "${outputs.newrelic_configure_with_key.error}"
  cases:
    invalid_key_format:
      do:
      ...
    invalid_key:
      do:
      ...
```

## Conditions - General

Conditions are part of `if` statements which are used to check the user’s state in order to decide how to progress. Some conditions also add information to the payload `outputs` to be used by other conditions or actions. In case `name` is set for condition, `outputs.<conditions_name>.success` will always be set.

Conditions support the following params:

| Name            | Type   | Mandatory | Default | Description                                                                                                                                                                              |
|-----------------|--------|-----------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| conditionid     | String | YES       | -       | String representing the condition. See section below for supported condition ids.                                                                                                        |
| equals          | Object | NO        | true    | Condition is successful if its return value is equals. Common usage is to evaluate the negation of the condition by setting equals: false.                                               |
| name            | String | NO        | null    | Name is mandatory in order to use condition outputs. If name is specified and condition enriches payload outputs, it can be accessed using: ${outputs.<condition_name>.<param_name>}.    |
| params          | Map    | NO        | null    | Each condition specifies which parameters it requires. Some parameters are passed transparently from the trigger payload and some must be configured.                                    |
| paramsFramework | Map    | NO        | null    | Used in cases framework selected by the user affects the parameters passed to the condition. It is a map from framework name to parameters.                                              |
| onFalseParams   | Map    | NO        | null    | Parameters to set on the global payload in case condition is unsuccessful. Common usage is list of conditions, each having its error message to be sent by the bot in case of a failure. |

Example:

```yaml
if:
  conditions:
  - conditionId: github_is_file_modified
    params:
      defaultResult: true
    paramsFramework:
      node:
        fileName: backend/app.js
    onFalseParams:
      pr_reject_message: "Did you make sure you added the `require` statement to the main app file?"
      pr_reject_message_name: "missing_require"

  - conditionId: github_is_file_modified
    params:
      defaultResult: true
    paramsFramework:
      python:
        fileName: backend/Procfile
    onFalseParams:
      pr_reject_message: "Looks like you did not update the `Procfile`. Remember you need to add the New Relic admin script command in front of your usual startup command options."
      pr_reject_message_name: "procfile_not_updated"

  - conditionId: github_is_file_modified
    params:
      defaultResult: true
    paramsFramework:
      node:
        fileName: backend/package.json
      rails:
        fileName: backend/Gemfile
      python:
        fileName: backend/requirements.txt
    onFalseParams:
      pr_reject_message: "Did you add the New Relic package to the dependency list? Make sure to add it to the **backend** project."
      pr_reject_message_name: "missing_dependency"

  - conditionId: github_is_file_added
    params:
      defaultResult: true
    paramsFramework:
      node:
        fileName: backend/newrelic.js
      rails:
        fileName: backend/config/newrelic.yml
      python:
        fileName: backend/newrelic.ini
    onFalseParams:
      pr_reject_message: "I don’t see a New Relic config file. Won’t work without it."
      pr_reject_message_name: "missing_config"

  - conditionId: github_is_file_contains
    equals: false
    params:
      regex: license_key
      defaultResult: false
    paramsFramework:
      node:
        fileName: backend/newrelic.js
      rails:
        fileName: backend/config/newrelic.yml
      python:
        fileName: backend/newrelic.ini
    onFalseParams:
      pr_reject_message: "I see you've committed a license key to Git. Shouldn't do that, security-wise. Please remove the entire property from the config file, we'll add it as an environment variable."
      pr_reject_message_name: "committed_license_key"

  - conditionId: github_is_file_added
    equals: false
    params:
      defaultResult: false
    paramsFramework:
      node:
        fileName: backend/package-lock.json
    onFalseParams:
      pr_reject_message: "I see you have both `package-lock.json` and `yarn.lock`. This can cause issues in the build. Let’s stick with just yarn for now, and remove the `package-lock.json`."
      pr_reject_message_name: "npm_lock_added"

  then:
    do:
    - actionId: bot_message
      params:
        person: lucca
        messages:
        - text: "Looking good! You can merge the PR now."
          delay: 1000
    - actionId: github_pr_approve
      params:
        person: lucca
        message: "Looking good! You can merge the PR now."

  else:
    do:
    - actionId: bot_message
      params:
        person: lucca
        messages:
        - text: "${pr_reject_message}"
          delay: 1000
    - actionId: github_pr_reject
      params:
        person: lucca
        message: "${pr_reject_message}"
        messageName: "${pr_reject_message_name}"
```

In this example, we see an `if` statement with several conditions. If all conditions are successful, a message is sent by the bot and the PR is approved. If a condition fails, the PR is rejected with a rejection message. The message text is set by each condition using `onFalseParams` .

Note the use of `equals: false` and the use of `paramsFramework` in this example.

## Supported Actions and Conditions

| Name                                     | Category | Type      | Description                                                                       | More Info |
| ---------------------------------------- | -------- | --------- | --------------------------------------------------------------------------------- | --------- |
| [text_contains_strings]                  | String   | Condition | Check if text contains subset of strings                                          |           |
| [text_match_regex]                       | String   | Condition | Check if text matches regex                                                       |           |
| [is_user_message_text_ready_to_continue] | Chat     | Condition | Check if user replied with a message that means they are ready to continue        |           |
| [bot_message]                            | Chat     | Action    | Send message from user to a bot                                                   |           |
| [github_is_user_valid]                   | Github   | Condition | Check if username exists in Github                                                |           |
| [github_is_file_modified]                | String   | Condition | Check if a specified file was modified as part of PR changes                      |           |
| [github_is_one_of_files_modified]        | Github   | Condition | Check if one of the specified files was modified as part of PR changes            |           |
| [github_is_file_add]                     | Github   | Condition | Check if specified files were added as part of PR changes.                        |           |
| [github_is_file_contains]                | Github   | Condition | Check if a file added in the PR contains text that matches a regex                |           |
| [github_is_repo_collaborator]            | Github   | Condition | "Check if the user accepted the invitation for their repo. "                      |           |
| [github_is_file_added_in_push]           | Github   | Condition | Check if a file was added in the head commit of a git push (not specific to a PR) |           |
| [github_create_repo]                     | Github   | Action    | Create new repo for the user.                                                     |           |
| [github_invite_user]                     | Github   | Action    | Invite user to collaborate on a Github repo.                                      |           |
| [github_pr_comment]                      | Github   | Action    | Add comment on a PR on behalf of one the bots.                                    |           |
| [github_pr_approve]                      | Github   | Action    | Approve the PR and add a comment on behalf of a bot.                              |           |
| [github_pr_reject]                       | Github   | Action    | Reject the PR and add a comment on behalf of a bot.                               |           |
| [github_open_issue]                      | Github   | Action    | Opens an issue in the user’s Github repository                                    |           |
| [github_commit_file]                     | Github   | Action    | Fommit a file to the user's repository                                            |           |
| [heroku_check_backend_config_var]        | Heroku   | Condition | Check if a config variable is set (exists) for the backend Heroku app.            |           |
| [heroku_check_frontend_config_var]       | Heroku   | Condition | Check if a config variable is set (exists) for the frontend Heroku app.           |           |
| [newrelic_license_key_valid]             | NewRelic | Condition | Check if the given key is a valid new relic license key.                          |           |
| [newrelic_configure_with_key]            | NewRelic | Action    | Configure user New Relic properties using given license key                       |           |
| [action_success]                         | General  | Condition | Check if the previously executed action block finished successfully               |           |
| [network_http_request]                   | Network  | Action    | Perform an http request                                                           |           |
| [is_truthy]                              | General  | Condition | Test if the expression is truthy                                                  |           |
| [is_falsy]                               | General  | Condition | Test if the expression is falsy                                                   |           |
| [database_check_connection_url]          | Database | Condition | Verify if the database connection url is valid                                    |           |
| [array_find]                             | Array    | Condition | Find an element in the array that matches specified conditions                    |           |
| [array_every]                            | Array    | Condition | Tests whether all elements in an array pass specified conditions                  |           |
| [finish_step]                            | Quest    | Action    | Advance the user to next step or finish quest in case this is the last step       |           |
| [quest_notification]                     | Quest    | Action    | Notify a user about an event that happened while in a quest.                      |           |

[Text Formatting]

[Triggers and Payload]: {% link docs/triggers-and-payload.md %}
[Text Formatting]: {% link docs/actions-and-conditions/text-formatting.md %}

[text_contains_strings]: {% link docs/actions-and-conditions/pages/text-contains-strings.md %}
[text_match_regex]: {% link docs/actions-and-conditions/pages/text-match-regex.md %}
[is_user_message_text_ready_to_continue]: {% link docs/actions-and-conditions/pages/is-user-message-text-ready-to-continue.md %}
[bot_message]: {% link docs/actions-and-conditions/pages/bot-message.md %}
[github_is_user_valid]: {% link docs/actions-and-conditions/pages/github-is-user-valid.md %}
[github_is_file_modified]: {% link docs/actions-and-conditions/pages/github-is-file-modified.md %}
[github_is_one_of_files_modified]: {% link docs/actions-and-conditions/pages/github-is-one-of-files-modified.md %}
[github_is_file_add]: {% link docs/actions-and-conditions/pages/github-is-file-add.md %}
[github_is_file_contains]: {% link docs/actions-and-conditions/pages/github-is-file-contains.md %}
[github_is_repo_collaborator]: {% link docs/actions-and-conditions/pages/github-is-repo-collaborator.md %}
[github_is_file_added_in_push]: {% link docs/actions-and-conditions/pages/github-is-file-added-in-push.md %}
[github_create_repo]: {% link docs/actions-and-conditions/pages/github-create-repo.md %}
[github_invite_user]: {% link docs/actions-and-conditions/pages/github-invite-user.md %}
[github_pr_comment]: {% link docs/actions-and-conditions/pages/github-pr-comment.md %}
[github_pr_approve]: {% link docs/actions-and-conditions/pages/github-pr-approve.md %}∏
[github_pr_reject]: {% link docs/actions-and-conditions/pages/github-pr-reject.md %}
[github_open_issue]: {% link docs/actions-and-conditions/pages/github-open-issue.md %}
[github_commit_file]: {% link docs/actions-and-conditions/pages/github-commit-file.md %}
[heroku_check_backend_config_var]: {% link docs/actions-and-conditions/pages/heroku-check-backend-config-var.md %}
[heroku_check_frontend_config_var]: {% link docs/actions-and-conditions/pages/heroku-check-frontend-config-var.md %}
[newrelic_license_key_valid]: {% link docs/actions-and-conditions/pages/newrelic-license-key-valid.md %}
[newrelic_configure_with_key]: {% link docs/actions-and-conditions/pages/newrelic-configure-with-key.md %}
[action_success]: {% link docs/actions-and-conditions/pages/action-success.md %}
[network_http_request]: {% link docs/actions-and-conditions/pages/network-http-request.md %}
[is_truthy]: {% link docs/actions-and-conditions/pages/is-truthy.md %}
[is_falsy]: {% link docs/actions-and-conditions/pages/is-falsy.md %}
[database_check_connection_url]: {% link docs/actions-and-conditions/pages/database-check-connection-url.md %}
[array_find]: {% link docs/actions-and-conditions/pages/array-find.md %}
[array_every]: {% link docs/actions-and-conditions/pages/array-every.md %}
[finish_step]: {% link docs/actions-and-conditions/pages/finish-step.md %}
[quest_notification]: {% link docs/actions-and-conditions/pages/quest-notification.md %}
