---
title: Message Components
parent: Writing Quest Texts
grand_parent: Building Your Quest
nav_order: 2
---

# Message Components
{: .no_toc }

Sending just plain text can be boring, so you can flavor things up with some interactive components! Message components lets you add interactivity and call to actions to your quests. Message components are supported in the `bot_message` action in Snack, and can be used as follows: 

```yml
- actionId: bot_message
  params:
    person: head-of-rd
    messages:
    - text: Some text goes here
      delay: 3000
      components: # list of components for this specific message
      - type: button
      - type: form
```

**General Guidelines**
- You can add several components on a single message
- You can send just the message component, text is optional
- Components will always be rendered at the end of all existing text messages


## Components
{: .no_toc }
- TOC
{:toc}

### Button

adds a basic call-to-action (CTA) to the message.

```yml
components:
- type: button
  action: navigate_to_page
  text: Navigate Somewhere
  params: 
    url: https://www.trywilco.com
```

We currently support a navigation action, with more actions coming soon!

{: .note-title }
> How will it look in Snack?
>
> ![button component]

### Single Select Form

```yml
components:
- type: form
  form:
    id: your_single_select_form_id
      type: single_select_form
      options:
        - label: 'Primary Button'
          value: accept
          variant: primary # optional, default: primary
        - label: 'Secondary Button'
          value: decline
          variant: secondary # optional, default: secondary
```

{: .note-title }
> How will it look in Snack?
>
> ![single-select form]

Once the user clicks one of the buttons, a [`chat_form_submitted`] trigger is fired, with the user's response in `formSubmission` variable.  You can receive the user's response and act on it in the trigger section, for example, we can check if the text contains a string:

```yml
trigger:
  type: chat_form_submitted
  params:
    formId: your_single_select_form_id
  flowNode:
    if:
      conditions:
      - conditionId: text_contains_strings
        params:
          text: "${formSubmission}"
          strings:
          - accept
      then:
        do:
        - actionId: your action here
      else:
        do:
        - actionId: a different action here
```

### Multi Select Form

Allows you to receive one or more options from the user, and act upon his response in the form trigger.

```yml
components:
- type: form
  form:
    id: your_form_id
    type: multi_select_form
    randomized: true # optional, default: false
    select_limit: 3 # optional, default: unlimited
    action_label: Submit Selection
    options: 
      # label is optional, will default to capitalize value field
      - value: opt_1
        label: Option 1
      - value: option 2
      - value: option 3
      - value: option 4
```

{: .note-title }
> How will it look in Snack?
>
> ![multi-select form]

The result of the form can either be a stringified list, or the actual object, depending how you reference it:
- `${formSubmission}` - Using single curly brackets will give a string, for example:  

    ```"[\"option_1\", \"option_2\"]"```

    You will be able to evaluate it with string conditions such as [`text_contains_strings`] and [`text_match_regex`]

- {% raw %}`${{formSubmission}}`{% endraw %} - Using double curly brackets will give the underline object, which is a JavaScript array of strings, and you will be able to evalute it with array conditions such as [`array_find`] and [`array_every`]

For example, using the array rendering:

```
trigger:
  type: chat_form_submitted
  params:
    formId: your_multi_select_form_id
  flowNode:
    if:
      conditions:
        - conditionId: array_find
          name: form_array_result
          params:
            array: {% raw %}${{formSubmission}}{% endraw %}
            conditions:
            - conditionId: text_contains_strings
              params:
                text: ${item}
                strings:
                - option_1
                - option_2
      then:
        do:
          - actionId: action to do if option_1 or option_2 were found
      else: 
        do:
          - actionId: action to do if they were not found
```



### Multi Select Form

Allows you to ask the user for a secret (i.e API key, connection string) that will be send in an encrypted manner and won't be shared with third parties.
This form is handled with it's own trigger `secret_submitted`

```yml
  - components:
      - type: form
        form:
          id: generic_mongo_connection_string_form
          type: secret_input_form
```

{: .note-title }
> How will it look in Snack?
>
> ![secret_input_form]

The submitted value can later be used to validate it's correctnes, and to be saved on the user for future use.
The value can be found in the trigger payload, using the following notation: `"${secretValue}"`

For example, here is a connection string submitted by the user:

```
trigger:
  type: secret_submitted
  flowNode:
    if:
      conditions:
        - conditionId: text_match_regex
          name: connection_string_prefix
          params:
            text: "${secretValue}"
            regex: "^mongodb"
        - conditionId: database_check_connection_url
          params:
            type: mongodb
            url: "${secretValue}"

      then:
        do:
          - actionId: user_set_integration_property
            params:
              integration: mongo
              key: connectionString
              value: ${secretValue}

          - actionId: bot_message
            params:
              person: ${defaultPerson}
              messages:
                - text: "That connection string looks good! we are ready to move on to the next step."
                  delay: 1300
          - actionId: finish_step
      else:
        do:
          - actionId: bot_message
            params:
              person: ${defaultPerson}
              messages:
                - text: "That's not correct, try again!"
```


[button component]: {% link assets/images/message-components/navigate.png %}
{:width="50%"}
[single-select form]: {% link assets/images/message-components/single-select.png %}
[multi-select form]: {% link assets/images/message-components/multi-select.png %}
[secret_input_form]: {% link assets/images/message-components/secret_input_form.png %}

[`chat_form_submitted`]: {% link docs/building-your-quest/triggers-and-payloads.md %}#chat_form_submitted
[`text_contains_strings`]: {% link docs/building-your-quest/conditions/text-contains-strings.md %}
[`text_match_regex`]: {% link docs/building-your-quest/conditions/text-match-regex.md %}
[`array_find`]: {% link docs/building-your-quest/conditions/array-find.md %}
[`array_every`]: {% link docs/building-your-quest/conditions/array-every.md %}
