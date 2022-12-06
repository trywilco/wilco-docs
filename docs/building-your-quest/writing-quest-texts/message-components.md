---
title: Message Components
parent: Writing Quest Texts
grand_parent: Building Your Quest
nav_order: 2
---

# Message Components
{: .no_toc }

Sending just plain text can be boring, so you can flavor things up with some interactive components! Message components lets you add interactivity and call to actions to your quests. Message components are supported in the `bot_message` action in Snack, and can be used as follow - 

```yml
- actionId: bot_message
  params:
    person: head-of-rd
    messages:
    - text: Some text goes here
      delay: 3000
    - components: // list of components for this specific message
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

Adds a basic CTA to the message. We currently support 

```yml
- components:
  - type: button
    action: navigate_to_page
    text: Navigate Somewhere
    params: 
      - url: https://www.trywilco.com
```

{: .note-title }
> How will it look in Snack?
>
> ![button component]

### Single Select Form

// TODO: add an example + trigger usage

```yml
    example goes here
```
{: .note-title }
> How will it look in Snack?
>
> ![single-select form]

### Multi Select Form

Allows you to receive one or more options from the user, and act upon his response in the form trigger

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

// TODO: add a trigger section and link it back here

{: .note-title }
> How will it look in Snack?
>
> ![multi-select form]


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