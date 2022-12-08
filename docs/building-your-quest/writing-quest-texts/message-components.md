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
    - components: # list of components for this specific message
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
- components:
  - type: button
    action: navigate_to_page
    text: Navigate Somewhere
    params: 
      - url: https://www.trywilco.com
```

We currently support a navigation action, with more actions coming soon!

{: .note-title }
> How will it look in Snack?
>
> ![button component]

### Single Select Form

```yml
- components:
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
- components:
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
          name: heroku_log
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

### Schedule Learning Time

Allow your players to schedule some time to continue their Wilco adventure. Clicking on the calendar button will open the relevant calendar with a pre-defined Wilco learning session. 

```yml
- components:
  - type: schedule_learning_time
  params: 
    navigate:
      show: true # optional, default: true
      text: Call to Action # optional, default: Start a Project
      url: https://www.trywilco.com # optional, default: in-game quest catalog
```

{: .note-title }
> How will it look in Snack?
>
> ![schedule learning time]

[button component]: {% link assets/images/message-components/navigate.png %}
{:width="50%"}

[schedule learning time]: {% link assets/images/message-components/learning-reminder.gif %}
[single-select form]: {% link assets/images/message-components/single-select.png %}
[multi-select form]: {% link assets/images/message-components/multi-select.png %}

[`chat_form_submitted`]: {% link docs/building-your-quest/triggers-and-payloads.md %}#chat_form_submitted
[`text_contains_strings`]: {% link docs/building-your-quest/conditions/text-contains-strings.md %}
[`text_match_regex`]: {% link docs/building-your-quest/conditions/text-match-regex.md %}
[`array_find`]: {% link docs/building-your-quest/conditions/array-find.md %}
[`array_every`]: {% link docs/building-your-quest/conditions/array-every.md %}