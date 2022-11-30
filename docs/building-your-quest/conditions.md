---
title: Conditions
parent: Building Your Quest
has_children: true
---

# Conditions 

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

<details markdown="block">
  <summary>
    Example
  </summary>
  {: .text-delta }

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
</details>

In this example, we see an `if` statement with several conditions. If all conditions are successful, a message is sent by the bot and the PR is approved. If a condition fails, the PR is rejected with a rejection message. The message text is set by each condition using `onFalseParams` .

Note the use of `equals: false` and the use of `paramsFramework` in this example.

## Supported Conditions

| Name                                     | Category  | Description                                                                       |
| ---------------------------------------- | --------- | --------------------------------------------------------------------------------- |
| [text_contains_strings]                  | String    | Check if text contains subset of strings                                          |
| [text_match_regex]                       | String    | Check if text matches regex                                                       |
| [is_user_message_text_ready_to_continue] | Chat      | Check if user replied with a message that means they are ready to continue        |
| [github_is_user_valid]                   | GitHub    | Check if username exists in Github                                                |
| [github_is_file_modified]                | GitHub    | Check if a specified file was modified as part of PR changes                      |
| [github_is_one_of_files_modified]        | GitHub    | Check if one of the specified files was modified as part of PR changes            |
| [github_is_file_added]                   | GitHub    | Check if specified files were added as part of PR changes.                        |
| [github_is_file_contains]                | GitHub    | Check if a file added in the PR contains text that matches a regex                |
| [github_is_repo_collaborator]            | GitHub    | "Check if the user accepted the invitation for their repo. "                      |
| [github_is_file_added_in_push]           | GitHub    | Check if a file was added in the head commit of a git push (not specific to a PR) |
| [heroku_check_backend_config_var]        | Heroku    | Check if a config variable is set (exists) for the backend Heroku app.            |
| [heroku_check_frontend_config_var]       | Heroku    | Check if a config variable is set (exists) for the frontend Heroku app.           |
| [newrelic_license_key_valid]             | New Relic | Check if the given key is a valid new relic license key.                          |
| [action_success]                         | General   | Check if the previously executed action block finished successfully               |
| [is_truthy]                              | General   | Test if the expression is truthy                                                  |
| [is_falsy]                               | General   | Test if the expression is falsy                                                   |
| [database_check_connection_url]          | Database  | Verify if the database connection url is valid                                    |
| [array_find]                             | Array     | Find an element in the array that matches specified conditions                    |
| [array_every]                            | Array     | Tests whether all elements in an array pass specified conditions                  |

[text_contains_strings]: {% link docs/building-your-quest/conditions/text-contains-strings.md %}
[text_match_regex]: {% link docs/building-your-quest/conditions/text-match-regex.md %}
[is_user_message_text_ready_to_continue]: {% link docs/building-your-quest/conditions/is-user-message-text-ready-to-continue.md %}
[github_is_user_valid]: {% link docs/building-your-quest/conditions/github-is-user-valid.md %}
[github_is_file_modified]: {% link docs/building-your-quest/conditions/github-is-file-modified.md %}
[github_is_one_of_files_modified]: {% link docs/building-your-quest/conditions/github-is-one-of-files-modified.md %}
[github_is_file_added]: {% link docs/building-your-quest/conditions/github-is-file-added.md %}
[github_is_file_contains]: {% link docs/building-your-quest/conditions/github-is-file-contains.md %}
[github_is_repo_collaborator]: {% link docs/building-your-quest/conditions/github-is-repo-collaborator.md %}
[github_is_file_added_in_push]: {% link docs/building-your-quest/conditions/github-is-file-added-in-push.md %}
[heroku_check_backend_config_var]: {% link docs/building-your-quest/conditions/heroku-check-backend-config-var.md %}
[heroku_check_frontend_config_var]: {% link docs/building-your-quest/conditions/heroku-check-frontend-config-var.md %}
[newrelic_license_key_valid]: {% link docs/building-your-quest/conditions/newrelic-license-key-valid.md %}
[action_success]: {% link docs/building-your-quest/conditions/action-success.md %}
[is_truthy]: {% link docs/building-your-quest/conditions/is-truthy.md %}
[is_falsy]: {% link docs/building-your-quest/conditions/is-falsy.md %}
[database_check_connection_url]: {% link docs/building-your-quest/conditions/database-check-connection-url.md %}
[array_find]: {% link docs/building-your-quest/conditions/array-find.md %}
[array_every]: {% link docs/building-your-quest/conditions/array-every.md %}

