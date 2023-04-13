---
title: Building Your Quest
has_children: true
nav_order: 5
---
To start building your quest, you can use the [**quest template**](https://github.com/trywilco/quest-template). Just click `Use this template`. 

# Quest Structure

Every uploaded quest must have the following components: 
- A file called `quest.yml` that configures the metadata of the quest
- An `assets` folder with cover image → [Assets]
- A `steps` folder with a yaml file for each step  → [Steps]

In addition, a `tests` folder can be added with test files to be used by the steps. → [Tests]
```
quest.zip
├── quest.yml
│
├── assets
│   ├── cover.jpeg
├── steps
│   ├── <step_id_1>.yml
│   ├── <step_id_2>.yml
│   ├── ...
│   └── <step_id_n>.yml
└── tests
    ├── <test_file_name_1>
    ├── <test_file_name_2>
    ├── ...
    └── <test_file_name_n>
```

## quest.yml

This is a mandatory file that must be placed at the root of the zip archive's structure. This file defines the metadata of the quest:

```yaml
id*: a unique quest identifier. Should not change. 3-50 characters, must begin with a letter. Accepted characters are A-Z, a-z, 0-9, and "_" | mandatory
title*: Quest title. 2-40 characters. All characters are accepted. "Funnel Drop" in the example below | mandatory
subtitle*: Quest subtitle. 2-68 characters. All characters are accepted. "Find the cause of user traffic drop in production and fix it" in the example below | mandatory
description*: Quest description. All characters are accepted. "What's worse.." in the example below | mandatory 
summary*: Quest summary. Shown when users finish the quest | mandatory 
level*: Quest level. beginner/intermediate/advanced | mandatory
duration*: Estimated number of hours required to finish the quest | mandatory
repository: The user's repo will be initialized to this repository when a quest starts. e.g. https://github.com/trywilco/Anythink-Market-Public | optional
shouldResetRepo: Whether the user's repo will be reset to specific code, set it to false when the quest does not involve any code | optional
resources: A list of resources that should be available to the user when the quest begins | optional 
- resource_1
- resource_2
- ...
- resource_n
steps*: List of all quest step ids | mandatory
- step_id_1
- step_id_2
- ...
- step_id_n
skills*: List of skills the user will work on when playing the quest | mandatory
- skill_1
- skill_2
- ...
- skill_n
questDependency: Quest that must be completed before playing this quest | optional
frameworks: Frameworks this quest will be available in | optional
  backend:
  - python
  - node
  frontend:
  - react
```

→ [Start Repository]

→ [Supported Skills]

→ [Quest Resources]


[Steps]: {% link docs/building-your-quest/creating-steps.md %}
[Assets]: {% link docs/building-your-quest/assets.md %}
[Tests]: {% link docs/building-your-quest/tests.md %}
[Start Repository]: {% link docs/building-your-quest/repository.md %}
[Supported Skills]: {% link docs/building-your-quest/supported-skills.md %}
[Quest Resources]: {% link docs/building-your-quest/quest-resources/index.md %}
